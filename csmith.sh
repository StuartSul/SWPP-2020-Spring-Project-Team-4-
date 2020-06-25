C_TO_LL=./test/c-to-ll.sh
COMPILER=./sf-compiler
COMPILER_BASELINE=./sf-compiler-baseline
INTERPRETER=./sf-interpreter
LLVM_BIN=abin
ROUNDS=100000

CSMITH_DIR=/usr/local/Cellar/csmith/2.3.0/include/csmith-2.3.0

for ((i=1;i<=$ROUNDS;i++));
do
        csmith --output main.c \
                --no-argc \
                --no-bitfields \
                --no-jumps \
                --no-arrays \
                --no-float \
                --no-packed-struct \
                --quiet \
                --no-structs \
                --no-unions \
                --no-volatiles \
                --no-global-variables \
                --max-expr-complexity 3 \
                --max-block-depth 2 \
                --max-block-size 2

        # Preprocess header
        gcc -E main.c -o main.p -I${CSMITH_DIR}
        mv main.p main.c

        # Convert printf(..) to a series of write() calls
        # In Mac, sed -i doesn't do in-place update
        sed -E 's/^[[:blank:]]+printf[[:blank:]]*\(\".*\", (.*), (.*)\)\;$/void write(uint64_t); write(\1); write(\2);/' ./main.c > main.tmp
        mv main.tmp main.c
        sed -E 's/^[[:blank:]]+printf[[:blank:]]*\(\".*\", (.*))\;$/void write(uint64_t); write(\1);/' ./main.c > main.tmp
        mv main.tmp main.c

        $C_TO_LL main.c $LLVM_BIN 2> main.dump
        $COMPILER main.ll -o main.s
        timeout 3 $INTERPRETER main.s &> /dev/null
        if [[ $? != 0 ]]
        then
                gcc main.c -o main.out &> /dev/null
                timeout 5 ./main.out &> /dev/null
                if [[ $? != 0 ]]
                then
                        printf "INIFINITE LOOP...SKIP (%s / %s)\n" $i $ROUNDS
                        rm main.out
                        continue
                else
			$COMPILER_BASELINE main.ll -o main.s
			timeout 5 $INTERPRETER main.s &> /dev/null
			if [[ $? != 0 ]]
			then
				printf "INIFINITE LOOP FOR BASELINE...SKIP (%s / %s)\n" $i $ROUNDS
				continue
			else
                        	echo "FAILED"
                       		rm platform.info
                        	exit
			fi
                fi
        fi
        if $INTERPRETER main.s | grep -q '0'
        then
		printf "" #printf "PASSED (%s / %s)\n" $i $ROUNDS
        else
                echo "FAILED"
                rm platform.info
                exit
        fi
        rm main.c main.ll main.dump main.s
done

rm platform.info

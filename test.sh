COMPILER=./sf-compiler
COMPILER_SPRINT3=./sf-compiler-sprint3
COMPILER_SPRINT2=./sf-compiler-sprint2
COMPILER_SPRINT1=./sf-compiler-sprint1
COMPILER_BASELINE=./sf-compiler-baseline
INTERPRETER=./sf-interpreter
TESTDIR=./test
OUTDIR=./out

TESTS="bitcount1 bitcount2 bitcount3 bitcount4 bitcount5 bubble_sort collatz gcd prime binary_tree matmul1 matmul2 matmul3 matmul4 rmq1d_naive rmq1d_sparsetable rmq2d_naive rmq2d_sparsetable jenkins_hash merge_sort polygon_area quick_sort radix_sort"

[ ! -d $OUTDIR ] && mkdir -p $OUTDIR
[ ! -d $OUTDIR/baseline ] && mkdir -p $OUTDIR/baseline
[ ! -d $OUTDIR/sprint1 ] && mkdir -p $OUTDIR/sprint1
[ ! -d $OUTDIR/sprint2 ] && mkdir -p $OUTDIR/sprint2
[ ! -d $OUTDIR/sprint3 ] && mkdir -p $OUTDIR/sprint3
[ ! -d $OUTDIR/current ] && mkdir -p $OUTDIR/current
[ ! -d $OUTDIR/baseline/outputs ] && mkdir -p $OUTDIR/baseline/outputs
[ ! -d $OUTDIR/sprint1/outputs ] && mkdir -p $OUTDIR/sprint1/outputs
[ ! -d $OUTDIR/sprint2/outputs ] && mkdir -p $OUTDIR/sprint2/outputs
[ ! -d $OUTDIR/sprint3/outputs ] && mkdir -p $OUTDIR/sprint3/outputs
[ ! -d $OUTDIR/current/outputs ] && mkdir -p $OUTDIR/current/outputs

for i in $TESTS; do
    printf "________TESTING %s________\n" $i

    $COMPILER $TESTDIR/$i/src/$i.ll -o $OUTDIR/current/$i.s

    if [ "$1" == "compare" ] && [ ! -z "$COMPILER_SPRINT3" ] && [ ! -f $OUTDIR/sprint3/$i.s ]; then
        $COMPILER_SPRINT3 $TESTDIR/$i/src/$i.ll -o $OUTDIR/sprint3/$i.s
    fi
    if [ "$1" == "compare" ] && [ ! -z "$COMPILER_SPRINT2" ] && [ ! -f $OUTDIR/sprint2/$i.s ]; then
        $COMPILER_SPRINT2 $TESTDIR/$i/src/$i.ll -o $OUTDIR/sprint2/$i.s
    fi
    if [ "$1" == "compare" ] && [ ! -z "$COMPILER_SPRINT1" ] && [ ! -f $OUTDIR/sprint1/$i.s ] && [[ " matmul1 matmul2 matmul3 matmul4 rmq1d_naive rmq1d_sparsetable rmq2d_naive rmq2d_sparsetable " != *"$i"* ]]; then
        $COMPILER_SPRINT1 $TESTDIR/$i/src/$i.ll -o $OUTDIR/sprint1/$i.s
    fi
    if [ "$1" == "compare" ] && [ ! -z "$COMPILER_BASELINE" ] && [ ! -f $OUTDIR/baseline/$i.s ]; then
        $COMPILER_BASELINE $TESTDIR/$i/src/$i.ll -o $OUTDIR/baseline/$i.s
    fi

    for ((j=1;j<=`ls -1 $TESTDIR/$i/test/input* | wc -l`;j++));
    do
        $INTERPRETER $OUTDIR/current/$i.s < $TESTDIR/$i/test/input$j.txt > $OUTDIR/current/outputs/$i"_output"$j.txt
        diff $TESTDIR/$i/test/output$j.txt $OUTDIR/current/outputs/$i"_output"$j.txt > $OUTDIR/.diff_tmp
        if [ "$?" -eq 0 ]; then
            printf "input %s: PASSED with " $j
            curr_line=0
            cost_line=2
            memu_line=3
            cat sf-interpreter.log | while read line; do
                curr_line=$(( curr_line+1 ))
                if [ $curr_line -eq $cost_line ]; then
                    printf "cost: %s" ${line:6}
                fi
                if [ $curr_line -eq $memu_line ]; then
                    if [ "$1" == "compare" ]; then
                        break
                    fi
                    printf ", heap usage: %s " ${line:24}
                    break
                fi
            done
            if [ "$1" == "compare" ]; then
                if [ ! -z "$COMPILER_SPRINT3" ]; then
                    if [ ! -f $OUTDIR/sprint3/outputs/$i"_output"$j.log ]; then
                        $INTERPRETER $OUTDIR/sprint3/$i.s < $TESTDIR/$i/test/input$j.txt > $OUTDIR/sprint3/outputs/$i"_output"$j.txt
                        cat sf-interpreter.log >> $OUTDIR/sprint3/outputs/$i"_output"$j.log
                    fi
                    curr_line=0
                    cost_line=2
                    cat $OUTDIR/sprint3/outputs/$i"_output"$j.log | while read line; do
                    curr_line=$(( curr_line+1 ))
                        if [ $curr_line -eq $cost_line ]; then
                            printf " (sprint3: %s)" ${line:6}
                            break
                        fi
                    done
                fi
                if [ ! -z "$COMPILER_SPRINT2" ]; then
                    if [ ! -f $OUTDIR/sprint2/outputs/$i"_output"$j.log ]; then
                        $INTERPRETER $OUTDIR/sprint2/$i.s < $TESTDIR/$i/test/input$j.txt > $OUTDIR/sprint2/outputs/$i"_output"$j.txt
                        cat sf-interpreter.log >> $OUTDIR/sprint2/outputs/$i"_output"$j.log
                    fi
                    curr_line=0
                    cost_line=2
                    cat $OUTDIR/sprint2/outputs/$i"_output"$j.log | while read line; do
                    curr_line=$(( curr_line+1 ))
                        if [ $curr_line -eq $cost_line ]; then
                            printf " (sprint2: %s)" ${line:6}
                            break
                        fi
                    done
                fi
                if [ ! -z "$COMPILER_SPRINT1" ] && [[ " matmul1 matmul2 matmul3 matmul4 rmq1d_naive rmq1d_sparsetable rmq2d_naive rmq2d_sparsetable " != *"$i"* ]]; then
                    if [ ! -f $OUTDIR/sprint1/outputs/$i"_output"$j.log ]; then
                        $INTERPRETER $OUTDIR/sprint1/$i.s < $TESTDIR/$i/test/input$j.txt > $OUTDIR/sprint1/outputs/$i"_output"$j.txt
                        cat sf-interpreter.log >> $OUTDIR/sprint1/outputs/$i"_output"$j.log
                    fi
                    curr_line=0
                    cost_line=2
                    cat $OUTDIR/sprint1/outputs/$i"_output"$j.log | while read line; do
                    curr_line=$(( curr_line+1 ))
                        if [ $curr_line -eq $cost_line ]; then
                            printf " (sprint1: %s)" ${line:6}
                            break
                        fi
                    done
                fi
                if [ ! -z "$COMPILER_BASELINE" ]; then
                    if [ ! -f $OUTDIR/baseline/outputs/$i"_output"$j.log ]; then
                        $INTERPRETER $OUTDIR/baseline/$i.s < $TESTDIR/$i/test/input$j.txt > $OUTDIR/baseline/outputs/$i"_output"$j.txt
                        cat sf-interpreter.log >> $OUTDIR/baseline/outputs/$i"_output"$j.log
                    fi
                    curr_line=0
                    cost_line=2
                    cat $OUTDIR/baseline/outputs/$i"_output"$j.log | while read line; do
                    curr_line=$(( curr_line+1 ))
                        if [ $curr_line -eq $cost_line ]; then
                            printf " (baseline: %s)" ${line:6}
                            break
                        fi
                    done
                fi
            fi
            printf "\n"
        else
            echo "    TEST FAILED"
            exit 11
        fi
    done
    rm $OUTDIR/.diff_tmp
done

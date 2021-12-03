#!/bin/zsh

# Set FLUKA directory
export FLUPRO=/Users/felixkling/work/FLUKA

cd GeneratedFiles

# Get input files for runs

# Input files for specific energies
# NUMS=($NUMS $(seq 1 18))
NUMS=($NUMS $(seq 1))
for NUM in $NUMS; do
    FILES=($FILES muons_$(echo $NUM)_left.inp muons_$(echo $NUM)_right.inp muons_$(echo $NUM)_top.inp muons_$(echo $NUM)_bot.inp)
done

echo $FILES
# Set number of processes you want to run simultaneously
MAXCPU=4
for FILE in $FILES; do
    echo $FILE
    ((i=i%$MAXCPU)); ((i++==0)) && wait
#    $FLUPRO/flutil/rfluka -N0 -M1 $FILE &
done

cd ..

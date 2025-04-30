# Generate multiple plots from one .csv file

# 1 --> csv name

# 2 --> attribute name 1
# 3 --> attribute name 2

# 4 --> rgb color 1
# 5 --> rgd color 2

# 6 --> min value of 'sent.seconds' in the csv file
# 7 --> max value of 'sent.seconds' in the csv file

# 8 --> min y-value
# 9 --> max y-value

# 10 --> output file name


#!/bin/sh
gnuplot <<EOF
set datafile separator ';'
plot './Datasets/Pipeline Data/$1' using 1:7 title "$2" lc rgb "#$4" lw 2 w lp, \
     './Datasets/Pipeline Data/$1' using 1:8 title "$3" lc rgb "#$5" lw 2 w lp
set title 'numbers and their squares'
set xlabel 'numbers'
set ylabel 'square of number'
set xrange [$6:$7]
set yrange [${8}:${9}]
set grid

set term png size 1200, 720
set output './Graphs/${10}.png'
replot
EOF
#set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set terminal postscript eps enhanced color

set key samplen 2 spacing 1.5 font ",22"

set xtics font ",15"
set ytics font ",15"
set ylabel font ",20"
set xlabel font ",20"

set xlabel "Random Number (Parameter)"
set ylabel "Average Time"
#set yrange[0:750]
#set xrange[0:2700]
set ytic auto
set xtic auto


set key top center

set output "aver.eps"
plot 'result.txt'  using 1:2 title "Thread 1" with lines, \
     ''  using 1:4 title "Thread 2" with lines ,\
     ''  using 1:6 title "Thread 4" with lines ,\
     ''  using 1:8 title "Thread 8" with lines ,\
     ''  using 1:10 title "Thread 16" with lines 

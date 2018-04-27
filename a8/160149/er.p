set terminal postscript eps enhanced color size 3.9,2.9
#set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set output "Variance.eps"

set key font ",22"
set xtics font ",15"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"
set xlabel "Random Numbers (Parameter)"
set ylabel "Variance"
#set yrange[-10000000:10000000]
#set autoscale y
#################
set yrange[-10000000:10000000]
#set logscale y
set ytic auto
set boxwidth 1 relative
set style data histograms
set style histogram cluster
set style fill pattern border

#set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
#set output "speedup_errorbar.eps"
set xtics rotate by -45
set style histogram errorbars lw 3
set style data histogram
set key top center
plot 'result.txt' u ($2/$2):3:xticlabels(1) title "Variance(1)",\
'' u ($4/$2):5 title "Variance(2)" fillstyle pattern 7,\
'' u ($6/$2):7 title "Variance(4)" fillstyle pattern 12,\
'' u ($8/$2):9 title "Variance(8)" fillstyle pattern 12,\
'' u ($10/$2):11 title "Variance(16)" fillstyle pattern 14
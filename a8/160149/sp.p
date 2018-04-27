set terminal postscript eps enhanced color size 3.9,2.9
#set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set output "speedup.eps"

set key font ",22"
set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"
set xlabel "Random Numbers (Parameter)"
set ylabel "Speedup"
set yrange[0:5]
set ytic auto
set boxwidth 1 relative
set style data histograms
set style histogram cluster
set style fill pattern border
plot 'result.txt' u ($2/$2):xticlabels(1) title "Speedup(1)",\
'' u ($2/$4) title "Speedup(2)" fillstyle pattern 7,\
'' u ($2/$6) title "Speedup(4)" fillstyle pattern 12,\
'' u ($2/$8) title "Speedup(8)" fillstyle pattern 12,\
'' u ($2/$10) title "Speedup(16)" fillstyle pattern 14
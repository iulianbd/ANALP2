set grid
set terminal pngcairo size 800,600 enhanced font 'Verdana,10'
set xrange [100:5000]

# =========================================================================
# 1. Comparativa: Tiempo medio de CPU (QuickSort min vs mean vs median)
# =========================================================================
set output 'qs_comparativa_tiempo.png'
set title 'Comparativa QuickSort: Tiempo medio de CPU'
set xlabel 'Tamaño de la permutación (N)'
set ylabel 'Tiempo medio de CPU (segundos)'
set key left top

plot 'quicksort_min.log' using 1:3 with linespoints pt 7 ps 1.2 lc rgb "#cc0000" title 'Pivot: Primero (min)', \
     'quicksort_mean.log' using 1:3 with linespoints pt 5 ps 1.2 lc rgb "#009900" title 'Pivot: Medio (mean)', \
     'quicksort_median.log' using 1:3 with linespoints pt 9 ps 1.2 lc rgb "#0000ff" title 'Pivot: Mediana (median)'

# =========================================================================
# 2. Comparativa: Operaciones Básicas Medias (QuickSort min vs mean vs median)
# =========================================================================
set output 'qs_comparativa_ob.png'
set title 'Comparativa QuickSort: Operaciones Básicas (Media)'
set xlabel 'Tamaño de la permutación (N)'
set ylabel 'Número medio de comparaciones (OB)'
set key left top

plot 'quicksort_min.log' using 1:4 with linespoints pt 7 ps 1.2 lc rgb "#cc0000" title 'Pivot: Primero (min)', \
     'quicksort_mean.log' using 1:4 with linespoints pt 5 ps 1.2 lc rgb "#009900" title 'Pivot: Medio (mean)', \
     'quicksort_median.log' using 1:4 with linespoints pt 9 ps 1.2 lc rgb "#0000ff" title 'Pivot: Mediana (median)'
set grid
set terminal pngcairo size 800,600 enhanced font 'Verdana,10'
set xrange [100:5000]

# =========================================================================
# 1. Comparativa: Tiempo medio de CPU (MergeSort vs QuickSort_median)
# =========================================================================
set output 'cuestion2_tiempo.png'
set title 'Comparativa de Rendimiento (Tiempo): MergeSort vs QuickSort_median'
set xlabel 'Tamaño de la permutación (N)'
set ylabel 'Tiempo medio de CPU (segundos)'
set key left top

plot 'mergesort.log' using 1:3 with linespoints pt 7 ps 1.2 lc rgb "#000000" title 'MergeSort', \
     'quicksort_median.log' using 1:3 with linespoints pt 9 ps 1.2 lc rgb "#0000ff" title 'QuickSort\_median'

# =========================================================================
# 2. Comparativa: Operaciones Básicas Medias (MergeSort vs QuickSort_median)
# =========================================================================
set output 'cuestion2_ob.png'
set title 'Comparativa de Operaciones Básicas: MergeSort vs QuickSort_median'
set xlabel 'Tamaño de la permutación (N)'
set ylabel 'Número medio de comparaciones (OB)'
set key left top

plot 'mergesort.log' using 1:4 with linespoints pt 7 ps 1.2 lc rgb "#000000" title 'MergeSort', \
     'quicksort_median.log' using 1:4 with linespoints pt 9 ps 1.2 lc rgb "#0000ff" title 'QuickSort\_median'
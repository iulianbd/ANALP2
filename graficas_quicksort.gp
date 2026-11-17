set grid
set terminal pngcairo size 800,600 enhanced font 'Verdana,10'

# Intervalo de ajuste (todos los datos medidos: N de 1000 a 10000)
set xrange [500:10500]

# -------------------------------------------------------------------------
# 1. QuickSort_min: Tiempo medio de CPU + ajuste
# -------------------------------------------------------------------------
f_t_min(x) = a1 * x * log(x) + b1
fit [1000:10000] f_t_min(x) 'quicksort_min.log' using 1:3 via a1, b1

set output 'qs_min_tiempo.png'
set title 'QuickSort\_min: Tiempo medio de CPU y ajuste'
set xlabel 'Tamaño de la permutación (N)'
set ylabel 'Tiempo medio de CPU (segundos)'
plot 'quicksort_min.log' using 1:3 with points pt 7 ps 1.2 lc rgb "#0066cc" title 'Tiempo medido', \
     f_t_min(x) with lines lw 2 lc rgb "#cc0000" title sprintf('Ajuste: %.2e·N·ln(N) + %.2e', a1, b1)

# -------------------------------------------------------------------------
# 2. QuickSort_min: Operaciones Básicas (Media, Mín, Máx) + ajuste media
# -------------------------------------------------------------------------
f_ob_min(x) = c1 * x * log(x) + d1
fit [1000:10000] f_ob_min(x) 'quicksort_min.log' using 1:4 via c1, d1

set output 'qs_min_ob.png'
set title 'QuickSort\_min: Operaciones Básicas (OB) y ajuste'
set xlabel 'Tamaño de la permutación (N)'
set ylabel 'Número de comparaciones (OB)'
plot 'quicksort_min.log' using 1:4 with points pt 7 ps 1.2 lc rgb "#0000ff" title 'Media OB', \
     'quicksort_min.log' using 1:5 with lines dt 2 lw 1.5 lc rgb "#009900" title 'Mínimo OB', \
     'quicksort_min.log' using 1:6 with lines dt 3 lw 1.5 lc rgb "#ff6600" title 'Máximo OB', \
     f_ob_min(x) with lines lw 2 lc rgb "#cc0000" title sprintf('Ajuste: %.2f·N·ln(N) + %.1f', c1, d1)

# -------------------------------------------------------------------------
# 3. QuickSort_mean: Tiempo medio de CPU + ajuste
# -------------------------------------------------------------------------
f_t_mean(x) = a2 * x * log(x) + b2
fit [1000:10000] f_t_mean(x) 'quicksort_mean.log' using 1:3 via a2, b2

set output 'qs_mean_tiempo.png'
set title 'QuickSort\_mean: Tiempo medio de CPU y ajuste'
set xlabel 'Tamaño de la permutación (N)'
set ylabel 'Tiempo medio de CPU (segundos)'
plot 'quicksort_mean.log' using 1:3 with points pt 7 ps 1.2 lc rgb "#0066cc" title 'Tiempo medido', \
     f_t_mean(x) with lines lw 2 lc rgb "#cc0000" title sprintf('Ajuste: %.2e·N·ln(N) + %.2e', a2, b2)

# -------------------------------------------------------------------------
# 4. QuickSort_mean: Operaciones Básicas (Media, Mín, Máx) + ajuste media
# -------------------------------------------------------------------------
f_ob_mean(x) = c2 * x * log(x) + d2
fit [1000:10000] f_ob_mean(x) 'quicksort_mean.log' using 1:4 via c2, d2

set output 'qs_mean_ob.png'
set title 'QuickSort\_mean: Operaciones Básicas (OB) y ajuste'
set xlabel 'Tamaño de la permutación (N)'
set ylabel 'Número de comparaciones (OB)'
plot 'quicksort_mean.log' using 1:4 with points pt 7 ps 1.2 lc rgb "#0000ff" title 'Media OB', \
     'quicksort_mean.log' using 1:5 with lines dt 2 lw 1.5 lc rgb "#009900" title 'Mínimo OB', \
     'quicksort_mean.log' using 1:6 with lines dt 3 lw 1.5 lc rgb "#ff6600" title 'Máximo OB', \
     f_ob_mean(x) with lines lw 2 lc rgb "#cc0000" title sprintf('Ajuste: %.2f·N·ln(N) + %.1f', c2, d2)

# -------------------------------------------------------------------------
# 5. QuickSort_median: Tiempo medio de CPU + ajuste
# -------------------------------------------------------------------------
f_t_med(x) = a3 * x * log(x) + b3
fit [1000:10000] f_t_med(x) 'quicksort_median.log' using 1:3 via a3, b3

set output 'qs_median_tiempo.png'
set title 'QuickSort\_median: Tiempo medio de CPU y ajuste'
set xlabel 'Tamaño de la permutación (N)'
set ylabel 'Tiempo medio de CPU (segundos)'
plot 'quicksort_median.log' using 1:3 with points pt 7 ps 1.2 lc rgb "#0066cc" title 'Tiempo medido', \
     f_t_med(x) with lines lw 2 lc rgb "#cc0000" title sprintf('Ajuste: %.2e·N·ln(N) + %.2e', a3, b3)

# -------------------------------------------------------------------------
# 6. QuickSort_median: Operaciones Básicas (Media, Mín, Máx) + ajuste media
# -------------------------------------------------------------------------
f_ob_med(x) = c3 * x * log(x) + d3
fit [1000:10000] f_ob_med(x) 'quicksort_median.log' using 1:4 via c3, d3

set output 'qs_median_ob.png'
set title 'QuickSort\_median: Operaciones Básicas (OB) y ajuste'
set xlabel 'Tamaño de la permutación (N)'
set ylabel 'Número de comparaciones (OB)'
plot 'quicksort_median.log' using 1:4 with points pt 7 ps 1.2 lc rgb "#0000ff" title 'Media OB', \
     'quicksort_median.log' using 1:5 with lines dt 2 lw 1.5 lc rgb "#009900" title 'Mínimo OB', \
     'quicksort_median.log' using 1:6 with lines dt 3 lw 1.5 lc rgb "#ff6600" title 'Máximo OB', \
     f_ob_med(x) with lines lw 2 lc rgb "#cc0000" title sprintf('Ajuste: %.2f·N·ln(N) + %.1f', c3, d3)
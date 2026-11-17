set terminal pngcairo size 800,600 enhanced font 'Arial,10'

# ==========================================
# Gráfica 1: Operaciones Básicas (OB)
# ==========================================
set output 'mergesort_ob.png'
set title 'MergeSort: Operaciones Básicas (Mejor, Peor, Medio y Ajuste)'
set xlabel 'Tamaño de la tabla (N)'
set ylabel 'Número de Operaciones Básicas (OB)'
set key left top

# Función de ajuste O(N log N)
f(x) = a*x*log(x) + b*x + c
fit f(x) 'mergesort.log' using 1:4 via a, b, c

plot 'mergesort.log' using 1:5 with linespoints pt 7 title 'Mejor Caso (Min OB)', \
     'mergesort.log' using 1:6 with linespoints pt 5 title 'Peor Caso (Max OB)', \
     'mergesort.log' using 1:4 with linespoints pt 9 title 'Caso Medio (Avg OB)', \
     f(x) with lines lw 2 lc rgb 'black' title 'Ajuste N log N'

# ==========================================
# Gráfica 2: Tiempo medio de reloj
# ==========================================
set output 'mergesort_time.png'
set title 'MergeSort: Tiempo medio de reloj y Ajuste'
set xlabel 'Tamaño de la tabla (N)'
set ylabel 'Tiempo (segundos)'
set key left top

# Función de ajuste O(N log N) para el tiempo
g(x) = d*x*log(x) + e*x + h
fit g(x) 'mergesort.log' using 1:3 via d, e, h

plot 'mergesort.log' using 1:3 with linespoints pt 7 lc rgb 'blue' title 'Tiempo Medio', \
     g(x) with lines lw 2 lc rgb 'black' title 'Ajuste N log N'
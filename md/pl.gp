file = "e2.csv"
set output file.".png"
set title ""
set xlabel "Input voltage (Volt)"
set ylabel "Error Voltage (Volt)"

set style line 101 lc rgb '#808080' lt 1 lw 1


# set terminal pngcairo size 500,500 enhanced font 'Verdana,10'

set terminal jpeg 
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels

set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically

set grid                               # display grid


# set key 0.01 100
#set label "Positions" at 0.003,260
#set arrow from 0.0028,250 to 0.003,280
#set xr [0.0:0.022]
#set xr [0:0.25]
# set yr [-11:11]
# set ytic add(16.97, -16.97, 3.6)
set datafile separator ","
# f(x) = a*x + b
# fit f(x) 'zdhv.csv' using 1:2 via a, b

# title_f(a,b) = sprintf('f(x) = %.2fx + %.2f', a, b)


# set yr [-12:12]

plot file using 1:($1*0.63661977236*2 - $2) title "error" with lines

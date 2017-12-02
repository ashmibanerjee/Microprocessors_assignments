

set   autoscale                        # scale axes automatically
      unset log                              # remove any log-scaling
      unset label                            # remove any previous labels
      set xtic auto                          # set xtics automatically
      set ytic auto                          # set ytics automatically
      set title "Optimised toUpper technique VS size using Intel Compiler"
      set xlabel "Size"
      set ylabel "Time"
      
	#plot 'intelimple3.txt' using 1:2 title 'optimised' with linespoints

 plot 'intelopt3.txt' using 2:8 title 'simple' with linespoints, '' using
2:10 title 'optimised' with linespoints
	

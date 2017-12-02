

set   autoscale                        # scale axes automatically
      unset log                              # remove any log-scaling
      unset label                            # remove any previous labels
      set xtic auto                          # set xtics automatically
      set ytic auto                          # set ytics automatically
	
      
      set title "Simple toUpper technique VS size "
      set xlabel "Size"
      set ylabel "Time"
      
      #plot 'results1' using 2:1 title 'simple' with linespoints, '' using
#1:3 title 'optimised' with linespoints
plot "results" u 1:2, \
     "results" u 1:3


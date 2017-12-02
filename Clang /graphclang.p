

set   autoscale                        # scale axes automatically
      unset log                              # remove any log-scaling
      unset label                            # remove any previous labels
      set xtic auto                          # set xtics automatically
      set ytic auto                          # set ytics automatically
      set title "Simple toUpper technique VS size "
      set xlabel "Size"
      set ylabel "Time"
      
	#plot 'clangsimple3.txt' using 1:2 title 'optimised' with linespoints

 plot 'clangsimple3.txt' using 2:8 title 'simple' with linespoints, '' using
2:10 title 'optimised' with linespoints
	

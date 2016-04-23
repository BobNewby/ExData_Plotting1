# plot2.R

source('DataSetup.R')

# we will call this macro both here and in plot4.R
plot2macro <- defmacro(T, T, expr = {
  with(sourceData,
       plot(
         DateTime, Global_active_power,
         xlab = '',
         ylab = 'Global Active Power (kilowatts)',
         pch = NA_integer_
       ))
  
  lines(sourceData$DateTime, sourceData$Global_active_power)
})

# plotting function (call this to make the plot)
makePlot2 <- function() {
  unlink('plot2.png')
  setUpData()
  
  cat('Creating plot2.png...\n')
  
  png(file = 'plot2.png')   # toggle between this and dev.copy(), as needed for debugging
  
  par(mfcol = c(1,1))
  
  plot2macro()

#   dev.copy(png, file = 'plot2.png')
  dev.off()
}

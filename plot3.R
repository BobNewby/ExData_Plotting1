# plot3.R

source('DataSetup.R')

# we will call this macro both here and in plot4.R
plot3macro <- defmacro(T, T, expr = {
  with(sourceData,
       plot(
         DateTime, Sub_metering_1,
         xlab = '',
         ylab = 'Energy sub metering',
         pch = NA_integer_
       ))
  
  lines(sourceData$DateTime, sourceData$Sub_metering_1)
  lines(sourceData$DateTime, sourceData$Sub_metering_2, col = 'red')
  lines(sourceData$DateTime, sourceData$Sub_metering_3, col = 'blue')
  
  legend('topright',
         c('SubMeter1','SubMeter2','SubMeter3'),
         pch = c('-','-','-'),
         pt.cex = 3,
         col = c('black','red','blue'),
         cex = 1
         )
})

# plotting function (call this to make the plot)
makePlot3 <- function() {
  unlink('plot3.png')
  setUpData()
  
  cat('Creating plot3.png...\n')
  
  png(file = 'plot3.png')   # toggle between this and dev.copy(), as needed for debugging
  
  par(mfcol = c(1,1))
  
  plot3macro()
  
#   dev.copy(png, file = 'plot3.png')
  dev.off()
}

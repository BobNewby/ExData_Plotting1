# plot4.R

source('DataSetup.R')

# local macro
plot4macro1 <- defmacro(T, T, expr = {
  with(sourceData,
       plot(
         DateTime, Voltage,
         pch = NA_integer_
       ))
  
  lines(sourceData$DateTime, sourceData$Voltage)
})

# local macro
plot4macro2 <- defmacro(T, T, expr = {
  with(sourceData,
       plot(
         DateTime, Global_reactive_power,
         pch = NA_integer_
       ))
  
  lines(sourceData$DateTime, sourceData$Global_reactive_power)
})

# plotting function (call this to make the plot)
makePlot4 <- function() {
  unlink('plot4.png')
  setUpData()
  
  cat('Creating plot4.png...\n')
  
  png(file = 'plot4.png')   # toggle between this and dev.copy(), as needed for debugging
  
  par(mfcol = c(2,2))
  
  plot2macro()
  
  plot3macro()
  
  plot4macro1()
  
  plot4macro2()
  
#   dev.copy(png, file = 'plot4.png')
  dev.off()
}

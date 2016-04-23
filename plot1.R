# plot1.R

source('DataSetup.R')

# we will call this macro both here and in plot4.R
plot1macro <- defmacro(T, T, expr = {
  with(sourceData,
       hist(Global_active_power,
            col = 'red', 
            xlab = 'Global Active Power (kilowatts)', 
            main = 'Global Active Power'))
})

# plotting function (call this to make the plot)
makePlot1 <- function() {
  unlink('plot1.png')
  setUpData()
  
  cat('Creating plot1.png...\n')
  
  png(file = 'plot1.png')   # toggle between this and dev.copy(), as needed for debugging
  
  par(mfcol = c(1,1))
  
  plot1macro()
  
#   dev.copy(png, file = 'plot1.png')
  dev.off()
}

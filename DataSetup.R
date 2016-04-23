# DataSetup.R

# load needed packages -- includes ones needed by plot1.R, plot2.R, etc.
library(dplyr)
library(lubridate)
library(gtools) # for use of macros

# set up data for all plots, if not already set up
setUpData <- function() {
  cat('Setting up data...\n')
  
  if ( exists('sourceData') ) {
    cat('Data is already loaded and prepared\n')
    return('Continue')
  }
  
  sourceDataURL <-
    'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  sourceDataZip <- 'household_power_consumption.zip'
  sourceDataFile <- 'household_power_consumption.txt'
  
  cat('Downloading data...\n')
  download.file(sourceDataURL, sourceDataZip, 'curl')
  
  cat('Unzipping datafile...\n')
  unzip(sourceDataZip)
  
  cat('Loading and preparing data...\n')
  sourceData <<- read.csv(sourceDataFile, sep=";", na.strings="?") %>%
    filter(Date == '1/2/2007' | Date == '2/2/2007') %>%
    mutate(DateTime = dmy(Date) + hms(Time))
  
  unlink(c(sourceDataZip, sourceDataFile))
  
  cat('Data is loaded and prepared\n')
  return('Continue')
}

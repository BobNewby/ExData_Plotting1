
# Preface

This document augments the repository's README.md file, which should be read first.

# Project's Files

This project consists of five (5) R files:

1. plot1.R -- Contains the function makePlot1(), which creates the plot1.png file.

2. plot2.R -- Contains the function makePlot2(), which creates the plot2.png file.

3. plot3.R -- Contains the function makePlot3(), which creates the plot3.png file.

4. plot4.R -- Contains the function makePlot4(), which creates the plot4.png file.

5. DataSetup.R -- Contains the function setUpData(), which is called by each of the above as a preparatory step.  Also loads required libraries (see next).

# Required Libraries

DataSetup.R expects three (3) libraries to be available:

- dplyr -- for data manipulation

- lubridate -- for creation of datetime values from the source data

- gtools -- for macro capability

# Code Factoring

The project's R files are factored such that no code is duplicated, neither one file to another nor within a file.  DataSetup.R provides common functionality, as mentioned above.  Also, plotting calls are factored into easily-reused macros; the code in plot4.R will make this idiom abundantly clear.

# Data

DataSetup.R -- via setUpData() -- provides the code that (i) downloads the zipped up source data; (ii) unzips it; (iii) trims it to only those rows needed for the project's plots; and (iv) combines data and time columns to make a DateTime column, this being required to produce the needed plots.

If plotting data already exists in the run-time environment, then setUpData() will not redo the above steps.  Thus the first call to a plotting function takes a bit of time to complete, whereas subsequent plotting-function calls run virtually instantaneously.
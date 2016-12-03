## Read the file and store into a new variable h_table:

h_data <- read.table("./data/household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

## Clear irrelevant data, Convert variables date format and into numeric, 
## and remove NAs:

library(dplyr)
library(lubridate)

h_data <- h_data %>% 
	mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
      V3 = as.numeric(as.character(V3)), rm.na=TRUE) %>% 
	select(V1,V3)

## Plot the graph:

with(h_data, plot(V1,V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
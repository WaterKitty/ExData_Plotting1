## Manually download the zip file and store it as "household_power_consumption.zip". 
## Unzip the Household Power Consumption file:

unzip(zipfile="./data/household_power_consumption.zip",exdir="./data")

## Read the file and store into a new variable h_table:

h_data <- read.table("./data/household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

## Clear irrelevant data, Convert V3 into numeric, and remove NAs:

library(dplyr)
h_data <- h_data %>% 
	select(V3) %>% 
	mutate(V3 = as.numeric(as.character(V3)), rm.na=TRUE)

## Plot the histogram:
png("plot1.png", width=480, height=480)
hist(h_data$V3, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")
dev.off()
##################################################################################################
##################################################################################################
##################################################################################################
#########               Plot2.R                                           ########################
##################################################################################################
##################################################################################################
##################################################################################################


##  Set Working Directory
setwd("C:/Users/Andrew/Desktop/Data Science Course/Exploratory Data Analysis/Course Project 1/ExData_Plotting1")

##  Read in file
dataFile <- "C:/Users/Andrew/Desktop/Data Science Course/Exploratory Data Analysis/Course Project 1/Project 1 Data/household_power_consumption.txt"
data_full <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##  Subset data to only include records from 1/2/2007 to 2/2/2007

data_subset <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]

#Create and Save Plot
## Format Date & Time
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(data_subset$Global_active_power)

## Save to file
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
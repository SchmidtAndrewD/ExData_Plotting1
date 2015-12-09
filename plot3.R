##################################################################################################
##################################################################################################
##################################################################################################
#########               Plot3.R                                           ########################
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
subMetering1 <- as.numeric(data_subset$Sub_metering_1)
subMetering2 <- as.numeric(data_subset$Sub_metering_2)
subMetering3 <- as.numeric(data_subset$Sub_metering_3)

## Save to file
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
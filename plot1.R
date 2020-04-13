###############
#  Exploratory Data Analysis
###############
#  Week 1, Course Project 1
###############
#  By David Bauer
#  April 2020
###############
#  Plot 1
##############

require(dplyr)

data = read.delim("household_power_consumption.txt", sep = ";")
data = filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data = mutate(data, dtgString = paste(Date, Time))
data = mutate(data, dtg = as.POSIXct(strptime(dtgString, format = "%d/%m/%Y %H:%M:%S")))
data = mutate(data, GAP = as.numeric(as.character(data$Global_active_power)))
data = mutate(data, GRP = as.numeric(as.character(data$Global_reactive_power)))
data = mutate(data, SM1 = as.numeric(as.character(data$Sub_metering_1)))
data = mutate(data, SM2 = as.numeric(as.character(data$Sub_metering_2)))
data = mutate(data, SM3 = as.numeric(as.character(data$Sub_metering_3)))
data = mutate(data, volt = as.numeric(as.character(data$Voltage)))


png("plot1.png", width = 480, height = 480)
hist(data$GAP, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

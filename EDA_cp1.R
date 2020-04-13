###############
#  Exploratory Data Analysis
###############
#  Week 1, Course Project 1
###############
#  By David Bauer
#  April 2020
###############
# This file has the code to read in the data and generate all four plots to the *screen* device.
# This was my original working file and is not part of the required files for turn-in
# Code from this file was copied into the individual plotting files, plot1.R, plot2.R, ...
###############


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

# Plot 1
hist(data$GAP, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Plot 2
plot(data$dtg, data$GAP, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Plot 3
plot(data$dtg, data$SM1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$dtg, data$SM2, col = "red")
lines(data$dtg, data$SM3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"), lty = c(1,1,1))

# Plot 4
# Didn't look correct until plotted directly to PNG
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
plot(data$dtg, data$GAP, type = "l", ylab = "Global Active Power", xlab = "")

plot(data$dtg, data$SM1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$dtg, data$SM2, col = "red")
lines(data$dtg, data$SM3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")

plot(data$dtg, data$volt, type = "l", ylab = "Voltage", xlab = "datetime")

plot(data$dtg, data$GRP, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()

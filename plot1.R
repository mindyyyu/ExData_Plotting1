setwd("/Users/mmmin/Desktop/coursera-coding/c4")
dataset <- read.table("household_power_consumption.txt", sep = ";", skip = 1, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
rightdate <- dataset[which(dataset[,1] == "1/2/2007" | dataset$Date == "2/2/2007"), ]
png(filename = "plot1.png", width = 480, height = 480)
par(mfrow = c(1,1))
hist(rightdate$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

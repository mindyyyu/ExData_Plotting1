setwd("/Users/mmmin/Desktop/coursera-coding/c4")
dataset <- read.table("household_power_consumption.txt", sep = ";", skip = 1, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
rightdate <- dataset[which(dataset[,1] == "1/2/2007" | dataset$Date == "2/2/2007"), ]
rightdate$Date <- as.Date(rightdate$Date, format = "%d/%m/%Y")
rightdate$date <- paste(rightdate$Date, rightdate$Time)
rightdate$date <- strptime(rightdate$date, format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(rightdate, {
        plot(date, Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")
        plot(date, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
})
with(rightdate, {
        plot(date, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
        lines(date, Sub_metering_2, col = "red")
        lines(date, Sub_metering_3, col = "blue")
        legend("topright", bty = "n", lty = 1, lwd = 1, cex = 0.4, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
with(rightdate, plot(date, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()


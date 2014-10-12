data <- read.csv("household_power_consumption.txt", 
                 sep = ";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$datetime <- strptime(paste(data$Date, data$Time, sep = ",")
                          , format = "%d/%m/%Y, %H:%M:%S")

png(file = "plot4.png")
par(mfrow = c(2,2))

with(data, plot(datetime, Global_active_power, type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)"))
with(data, plot(datetime, Voltage, type = "l"))
with(data, plot(datetime, Sub_metering_1, type = "l", 
                col = "black", xlab = "", ylab = "Energy sub metering"))
with(data, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(data, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                      "Sub_metering_3"),
                bty = "n", lty = 1, lwd = 2, col = c("black", "red", "blue"))
with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
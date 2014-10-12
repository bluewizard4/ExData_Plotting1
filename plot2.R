data <- read.csv("household_power_consumption.txt", 
                 sep = ";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$datetime <- strptime(paste(data$Date, data$Time, sep = ",")
                          , format = "%d/%m/%Y, %H:%M:%S")

png(file = "plot2.png")

with(data, plot(datetime, Global_active_power, type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()
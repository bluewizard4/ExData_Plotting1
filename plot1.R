data <- read.csv("household_power_consumption.txt", 
                 sep = ";", na.strings = "?")
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

png(file = "plot1.png")

with(data2, hist(Global_active_power, 
                 main = "Global Active Power",
                 xlab = "Global Active Power (kilowatts)",
                 col = "red"))

dev.off()

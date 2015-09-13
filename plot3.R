library(data.table)

## reading the data
fulldata <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")

## subsetting data
subdata <- subset(fulldata, fulldata$Date == "2007-02-01" | fulldata$Date == "2007-02-02")
dateTime <- strptime(paste(subdata$Date, subdata$Time), format = "%Y-%m-%d %H:%M:%S")

## creating the plot
png(filename = "plot3.png")
plot(dateTime, subdata$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", col = "black")
lines(dateTime, subdata$Sub_metering_2, col = "red")
lines(dateTime, subdata$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


library(data.table)

## reading the data
fulldata <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")

## subsetting data
subdata <- subset(fulldata, fulldata$Date == "2007-02-01" | fulldata$Date == "2007-02-02")
dateTime <- strptime(paste(subdata$Date, subdata$Time), format = "%Y-%m-%d %H:%M:%S")

## creating the plot
png(filename = "plot4.png")

## 4 charts in a single plot
par(mfcol = c(2,2))

## 1st Chart (Top left corner)
plot(dateTime, subdata$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")

## 2nd Chart (Bottom left corner)
plot(dateTime, subdata$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", col = "black")
lines(dateTime, subdata$Sub_metering_2, col = "red")
lines(dateTime, subdata$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

## 3rd Chart (Top right corner)
plot(dateTime, subdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## 4th Chart (Bottom right corner)
plot(dateTime, subdata$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

library(data.table)

## reading the data
fulldata <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")

## subsetting data
subdata <- subset(fulldata, fulldata$Date == "2007-02-01" | fulldata$Date == "2007-02-02")
dateTime <- strptime(paste(subdata$Date, subdata$Time), format = "%Y-%m-%d %H:%M:%S")

## creating the plot
png(filename = "plot2.png")
plot(dateTime, subdata$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowats)", xlab = "")
dev.off()

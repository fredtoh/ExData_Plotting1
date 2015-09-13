library(data.table)

## reading the data
fulldata <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%Y")

## subsetting data
subdata <- subset(fulldata, fulldata$Date == "2007-02-01" | fulldata$Date == "2007-02-02")

# creating the plot
png(filename = "plot1.png")
hist(as.numeric(subdata$Global_active_power), main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

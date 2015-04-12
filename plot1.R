##source code for Exploratory Data Analysis Project #1 Plot #1

library(data.table)
raw <- fread("household_power_consumption.txt")
filtered <- subset(raw, raw$Date == "1/2/2007" |raw$Date == "2/2/2007")

filtered$Global_active_power <- as.numeric(filtered$Global_active_power)
filtered$Global_reactive_power <- as.numeric(filtered$Global_reactive_power)
filtered$Voltage <- as.numeric(filtered$Voltage)
filtered$Global_intensity <- as.numeric(filtered$Global_intensity)
filtered$Sub_metering_1 <- as.numeric(filtered$Sub_metering_1)
filtered$Sub_metering_2 <- as.numeric(filtered$Sub_metering_2)
filtered$Sub_metering_3 <- as.numeric(filtered$Sub_metering_3)

##construct the plot
png("plot1.png", width=480, height=480)
hist(filtered$Global_active_power, c(0.0,0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5,7.0,7.5),
     col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

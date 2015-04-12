##source code for Exploratory Data Analysis Project #1 Plot #2

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

## library to help create DateTime object
library(lubridate)
filtered$DateTime <- dmy_hms(paste(filtered$Date, filtered$Time))

##construct the plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(filtered, {
  plot(filtered$DateTime, filtered$Global_active_power, type="l", xlab="", ylab = "Global Active Power")
  plot(filtered$DateTime, filtered$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(filtered$DateTime, filtered$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n")
  points(DateTime, Sub_metering_1, type = "l", col = "black")
  points(DateTime, Sub_metering_2, type = "l", col = "red")
  points(DateTime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty= 1, box.lty=0, cex=0.8, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

  plot(filtered$DateTime, filtered$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

})
dev.off()
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
png("plot3.png", width=480, height=480)
with(filtered, plot(DateTime, Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n"))
with(subset(filtered), points(DateTime, Sub_metering_1, type = "l", col = "black"))
with(subset(filtered), points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(subset(filtered), points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
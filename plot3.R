data = read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
library(stringr)
data$Day = as.Date(data$Date, format="%d/%m/%Y")
data2 = subset(data, Day == "2007-02-1" | Day =="2007-02-02")
data2$DayTime = strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480, units = "px")
par(mfrow = c(1,1))
plot(data2$DayTime, data2$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(data2$DayTime, data2$Sub_metering_1, type="l", col = "black")
points(data2$DayTime, data2$Sub_metering_2, type="l", col = "red")
points(data2$DayTime, data2$Sub_metering_3, type="l", col = "blue")
legend("topright", lty=c(1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

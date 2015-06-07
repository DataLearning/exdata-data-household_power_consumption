data = read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
data$Day = as.Date(data$Date, format="%d/%m/%Y")
data2 = subset(data, Day == "2007-02-1" | Day =="2007-02-02")

png("plot1.png", width = 480, height = 480, units = "px")
par(mfrow = c(1,1))
hist(data2$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.off()

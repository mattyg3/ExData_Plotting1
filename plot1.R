##plot1
{
power <- read.delim("D:/surff/Desktop/R Stuff/household_power_consumption.txt", sep=";")
power$date_time <- paste(power$Date, " ", power$Time)
power$date_time <- as.POSIXlt(power$date_time, format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.POSIXlt(power$Date, format = "%d/%m/%Y")
power_feb <- subset(power, format(Date, "%Y-%m-%d") %in% c("2007-02-01", "2007-02-02"))
power_feb$Global_active_power <- as.numeric(power_feb$Global_active_power)
power_feb$Global_active_power_KW <- power_feb$Global_active_power/1000

png("plot1.png", width = 480, height = 480)
hist(power_feb$Global_active_power_KW, col = "red", main = "Global Active Power"
     ,breaks = seq(0, 6, 0.5),xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
}

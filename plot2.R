##plot2
{power <- read.delim("D:/surff/Desktop/R Stuff/household_power_consumption.txt", sep=";")
power$date_time <- paste(power$Date, " ", power$Time)
power$date_time <- as.POSIXlt(power$date_time, format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.POSIXlt(power$Date, format = "%d/%m/%Y")
power_feb <- subset(power, format(Date, "%Y-%m-%d") %in% c("2007-02-01", "2007-02-02"))
power_feb$Global_active_power <- as.numeric(power_feb$Global_active_power)
power_feb$Global_active_power_KW <- power_feb$Global_active_power/1000

png("plot2.png", width = 480, height = 480)
plot(power_feb$date_time, power_feb$Global_active_power_KW, type="l", ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.off()}

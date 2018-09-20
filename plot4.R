##plot4
{power <- read.delim("D:/surff/Desktop/R Stuff/household_power_consumption.txt", sep=";")
power$date_time <- paste(power$Date, " ", power$Time)
power$date_time <- as.POSIXlt(power$date_time, format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.POSIXlt(power$Date, format = "%d/%m/%Y")
power_feb <- subset(power, format(Date, "%Y-%m-%d") %in% c("2007-02-01", "2007-02-02"))
power_feb$Global_active_power <- as.numeric(power_feb$Global_active_power)
power_feb$Global_active_power_KW <- power_feb$Global_active_power/1000

png("plot4.png", width = 480, height = 480)
{
    par(mfrow=c(2,2))
    plot(power_feb$date_time, power_feb$Global_active_power_KW, type="l", ylab = "Global Active Power (Kilowatts)", xlab = "")
    plot(power_feb$date_time, power_feb$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
    
    {plot(power_feb$date_time, power_feb$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "") 
        lines(power_feb$date_time, power_feb$Sub_metering_2, col = "red") 
        lines(power_feb$date_time, power_feb$Sub_metering_3, col = "blue") 
        legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col  = c("black", "red", "blue"), lty=1 ,cex=0.65)
    }
    plot(power_feb$date_time, power_feb$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")
}
dev.off()}

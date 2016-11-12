power <- read.table("household_power_consumption.txt", header= T, sep = ";", na.strings = "?")
subPower <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]


subPower$fullDate <- strptime(paste(subPower$Date, subPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English") # for weekdays to display in english

png("plot4.png", width=480, height=480)
with(subPower, {
  par(mfrow = c(2, 2))
  
  plot(fullDate, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  plot(fullDate, Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(fullDate, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
  lines(fullDate, Sub_metering_2, type="l", col="red")
  lines(fullDate, Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
  
  plot(fullDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
}
     )
dev.off()
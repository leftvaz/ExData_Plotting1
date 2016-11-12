power <- read.table("household_power_consumption.txt", header= T, sep = ";", na.strings = "?")
subPower <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]


subPower$fullDate <- strptime(paste(subPower$Date, subPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English") # for weekdays to display in english

png("plot2.png", width=480, height=480)
with(subPower, plot(fullDate, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
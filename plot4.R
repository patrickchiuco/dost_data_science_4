dataFilePath <- ""
g <-read.table(dataFilePath, sep=";", skip=66636, nrow=2880, col.names = c("Date", "Time", "Global_active_power",
      "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png(file="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
g["Datetime"] <- paste(g$Date,g$Time)
g$Datetime <- strptime(g$Datetime, format="%d/%m/%Y %H:%M:%S")
plot(g$Datetime,g$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(g$Datetime,g$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(g$Datetime,g$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(g$Datetime,g$Sub_metering_2, col="red", type="l")
points(g$Datetime,g$Sub_metering_3, col="blue", type="l")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty = 0)
plot(g$Datetime,g$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()

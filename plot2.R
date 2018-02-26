dataFilePath <- ""
g <-read.table(dataFilePath, sep=";", skip=66637, nrow=2880, col.names = c("Date", "Time", "Global_active_power",
      "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png(file="plot2.png", width=480, height=480, units="px")
g["Datetime"] <- paste(g$Date,g$Time)
g$Datetime <- strptime(g$Datetime, format="%d/%m/%Y %H:%M:%S")
plot(g$Datetime,g$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()


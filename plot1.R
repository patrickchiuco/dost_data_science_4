dataFilePath <- ""
g <-read.table(dataFilePath, sep=";", skip=66637, nrow=2880,
                col.names = c("Date", "Time", "Global_active_power","Global_reactive_power", "Voltage",
                              "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

png(file="plot1.png", width=480, height=480, units="px")
hist(g$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

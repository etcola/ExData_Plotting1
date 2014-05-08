# plot4.R
# It's assumed that the data is put in the work directory.
library(data.table)

filePath <- "household_power_consumption.txt"
minutes_of_2_days <- 60 * 24 * 2 
DT <- fread(filePath, na.strings="?", skip="1/2/2007", nrows= minutes_of_2_days)
colnames(DT) <- colnames(fread(filePath, nrows=0))

# Bewared: the default setting in png() function is 480x480 pixels.
png("plot4.png")

# Pay attention to the order of plotting when using mfcol.
par(mfcol=c(2,2), oma=c(1,0,0,0))

# plot4.1
with(DT, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type="l", xlab="", ylab="Globall Active Power (kilowatts)"))

# plot4.2
with(DT, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"))
with(DT, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, type="l", col="red"))
with(DT, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, type="l", col="blue"))
legend("topright", col=c("black", "red", "blue"),  lty="solid", box.lwd=0, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot4.3
with(DT, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Voltage, type="l", xlab="datetime", ylab="Voltage"))

# plot4.4
with(DT, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()
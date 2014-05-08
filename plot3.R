# plot3.R
# It's assumed that the data is put in the work directory.
library(data.table)

filePath <- "household_power_consumption.txt"
minutes_of_2_days <- 60 * 24 * 2 
DT <- fread(filePath, na.strings="?", skip="1/2/2007", nrows= minutes_of_2_days)
colnames(DT) <- colnames(fread(filePath, nrows=0))

# Bewared: the default setting in png() function is 480x480 pixels.
png("plot3.png")
with(DT, plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"))
with(DT, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, type="l", col="red"))
with(DT, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, type="l", col="blue"))
legend("topright", col=c("black", "red", "blue"),  lty="solid", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
# plot1.R
# It's assumed that the data is put in the work directory.
library(data.table)

filePath <- "household_power_consumption.txt"
minutes_of_2_days <- 60 * 24 * 2 
DT <- fread(filePath, na.strings="?", skip="1/2/2007", nrows= minutes_of_2_days)
colnames(DT) <- colnames(fread(filePath, nrows=0))

# Bewared: the default setting in png() function is 480x480 pixels.
png("plot1.png")
hist(DT[,Global_active_power], col="red", main="Global Active Power", xlab="Globall Active Power (kilowatts)")
dev.off()
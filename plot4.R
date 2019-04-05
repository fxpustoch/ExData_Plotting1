
setwd("/Users/fxpustoch/Desktop/Coursera/R/Graphs")

Sys.setlocale("LC_TIME", "en_US")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

# Size of the data set
print(object.size(data))
# 149965488 bytes

# Apply the Date format
# https://www.gormanalysis.com/blog/dates-and-times-in-r-without-losing-your-sanity/
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# filter the dates
data <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data <- subset(data, is.na(Date) == FALSE)

# Create the DataTime column
mergeDateTime <- paste(data$Date, data$Time)
dateTime <- strptime(mergeDateTime, "%Y-%m-%d %H:%M:%S")
data <- cbind(dateTime, data)

# Create plots

# PLOT 4
# the default graph is too messy. need to change the parameters of par()
# https://www.rdocumentation.org/packages/graphics/versions/3.5.3/topics/par
#https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/legend.html
png("plot4.png")
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
par(mfrow = c(2,2), mar = c(4,4,1,1))
plot(data$dateTime, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(data$dateTime, data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(data$dateTime, data$Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering")
lines(data$dateTime, data$Sub_metering_2, type="l", col="red")
lines(data$dateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col= c("black","red", "blue"))
plot(data$dateTime, data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()



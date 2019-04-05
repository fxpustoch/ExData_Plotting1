
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

# PLOT 2
#https://www.rdocumentation.org/packages/graphics/versions/3.5.3/topics/plot
png("plot2.png")
plot(data$dateTime, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


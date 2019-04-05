
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

# PLOT 1
# https://www.rdocumentation.org/packages/ursa/versions/3.8.8/topics/hist
png("plot1.png") 
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

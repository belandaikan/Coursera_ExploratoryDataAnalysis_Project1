data <- read.csv(unz("household_power_consumption.zip", 
                     "household_power_consumption.txt"), sep = ";")

data$Date<-as.Date(data$Date, format="%d/%m/%Y")
set <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
day <- function(x) format(as.Date(x), "%A")
set$day <- as.factor(day(set$Date))
set$DateTime <- paste(set$Date, set$Time)
set$DateTime_2 <- strptime(set$DateTime,  "%Y-%m-%d %H:%M:%S")

set$Sub_metering_1<-as.numeric(as.character(set$Sub_metering_1))
set$Sub_metering_2<-as.numeric(as.character(set$Sub_metering_2))
set$Sub_metering_3<-as.numeric(as.character(set$Sub_metering_3))

png(width = 480, height = 480, filename = "plot3.png", bg = "transparent")
plot(set$DateTime_2, set$Sub_metering_1, type = 'l', col = "black", xlab='', ylab = "Energy sub metering")
points(set$DateTime_2, set$Sub_metering_2, type = 'l', col = "red")
points(set$DateTime_2, set$Sub_metering_3, type = 'l', col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
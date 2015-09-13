data <- read.csv(unz("household_power_consumption.zip", 
                     "household_power_consumption.txt"), sep = ";")

data$Date<-as.Date(data$Date, format="%d/%m/%Y")
set <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
day <- function(x) format(as.Date(x), "%A")
set$day <- as.factor(day(set$Date))
set$DateTime <- paste(set$Date, set$Time)
set$DateTime_2 <- strptime(set$DateTime,  "%Y-%m-%d %H:%M:%S")

set$Global_active_power<-as.numeric(as.character(set$Global_active_power))

set$Global_active_power<-as.numeric(as.character(set$Global_active_power))

set$Voltage<-as.numeric(as.character(set$Voltage))

set$Global_reactive_power<-as.numeric(as.character(set$Global_reactive_power))



png(width = 480, height = 480, filename = "plot4.png", bg = "transparent")
par(mfrow=c(2,2))
#Global Active Power
plot(set$DateTime_2, set$Global_active_power, type = "l", ylab = "Global Active Power", xlab = '')

#Voltage
plot(set$DateTime_2, set$Voltage, type = 'l', col = "black", xlab='datetime', ylab = "Voltage")

#Energy Submetering
set$Sub_metering_1<-as.numeric(as.character(set$Sub_metering_1))
set$Sub_metering_2<-as.numeric(as.character(set$Sub_metering_2))
set$Sub_metering_3<-as.numeric(as.character(set$Sub_metering_3))
plot(set$DateTime_2, set$Sub_metering_1, type = 'l', col = "black", xlab='', ylab = "Energy sub metering")
points(set$DateTime_2, set$Sub_metering_2, type = 'l', col = "red")
points(set$DateTime_2, set$Sub_metering_3, type = 'l', col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Global Reactive Power
plot(set$DateTime_2, set$Global_reactive_power, type = 'l', col = "black", xlab='datetime', ylab = "Global_reactive_power")

dev.off()
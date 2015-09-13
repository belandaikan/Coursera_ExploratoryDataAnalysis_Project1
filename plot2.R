data <- read.csv(unz("household_power_consumption.zip", 
                     "household_power_consumption.txt"), sep = ";")

data$Date<-as.Date(data$Date, format="%d/%m/%Y")

set <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

set$Global_active_power<-as.numeric(as.character(set$Global_active_power))

day <- function(x) format(as.Date(x), "%A")
set$day <- as.factor(day(set$Date))

set$DateTime <- paste(set$Date, set$Time)
set$DateTime_2 <- strptime(set$DateTime,  "%Y-%m-%d %H:%M:%S")
png(width = 480, height = 480, filename = "plot2.png", bg = "transparent")
plot(set$DateTime_2, set$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = '')
dev.off()
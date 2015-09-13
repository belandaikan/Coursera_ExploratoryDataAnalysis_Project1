data <- read.csv(unz("household_power_consumption.zip", 
                    "household_power_consumption.txt"), sep = ";")

data$Date<-as.Date(data$Date, format="%d/%m/%Y")

set <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

set$Global_active_power<-as.numeric(as.character(set$Global_active_power))

png(width = 480, height = 480, filename = "plot1.png", bg = "transparent")

hist(set$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
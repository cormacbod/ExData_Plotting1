if(!require("sqldf"))
  install.packages("sqldf")
library(sqldf)

data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="select*from file where Date in ('1/2/2007', '2/2/2007')")

data$DateTime <- paste(data$Date, data$Time)

data$DateTimePosix <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")


png("plot3.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))

plot(data$DateTimePosix, data$Sub_metering_1, xlab="", ylab="Energy Sub Metering", type = "n")


lines(data$DateTimePosix, data$Sub_metering_1, type="l")
lines(data$DateTimePosix, data$Sub_metering_2, type="l", col="Red")
lines(data$DateTimePosix, data$Sub_metering_3, type="l", col="Blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","blue","red"), lwd=c(2.5,2.5,2.5))

dev.off()
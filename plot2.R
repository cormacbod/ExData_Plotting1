if(!require("sqldf"))
  install.packages("sqldf")
library(sqldf)

data <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";", sql="select*from file where Date in ('1/2/2007', '2/2/2007')")

data$DateTime <- paste(data$Date, data$Time)

data$DateTimePosix <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))

plot(data$DateTimePosix, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "n")
lines(data$DateTimePosix, data$Global_active_power, type="l")

dev.off()

file <- "household_power_consumption.txt"
file <- file(file)
data <- sqldf("select * from file where Date == '1/2/2007' OR Date == '2/2/2007'",
              file.format = list(sep = ";", header = TRUE, na.strings = "?"))

library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data$dateTime <- data$Date + data$Time


png(filename = "plot4.png")
par(mfrow = c(2,2))
with(data, plot(dateTime, Global_active_power,
                type = "l",
                xlab = "", ylab = "Global Active Power"))
with(data, plot(dateTime, Voltage,
                type = "l"))
with(data, plot(dateTime, Sub_metering_1,
                type = "l",
                xlab = "",
                ylab = "Energy sub metering"))
with(data, lines(dateTime, Sub_metering_2,
                 col = "red"))
with(data, lines(dateTime, Sub_metering_3,
                 col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = "solid", bty = "n")
with(data, plot(dateTime, Global_reactive_power,
                type = "l"))
dev.off()




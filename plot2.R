file <- "household_power_consumption.txt"
file <- file(file)
data <- sqldf("select * from file where Date == '1/2/2007' OR Date == '2/2/2007'",
              file.format = list(sep = ";", header = TRUE, na.strings = "?"))


library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data$dateTime <- data$Date + data$Time


png(filename = "plot2.png")
with(data, plot(dateTime, Global_active_power,
                type = "l",
                xlab = "",
                ylab = "Global Active Power (kilowatts)"))
dev.off()
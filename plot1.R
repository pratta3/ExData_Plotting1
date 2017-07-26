file <- "household_power_consumption.txt"
file <- file(file)
data <- sqldf("select * from file where Date == '1/2/2007' OR Date == '2/2/2007'",
              file.format = list(sep = ";", header = TRUE, na.strings = "?"))

library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)


png(filename = "plot1.png")
hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
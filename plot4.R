#load data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep = ";", stringsAsFactors=FALSE, na.strings = "?")

#selected data on "2007-02-01" and "2007-02-02"
data$Date <- as.Date(data$Date, "%d/%m/%Y")
days <- as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d")
selected <- subset(data, data$Date %in% days)

#convert data columns to correct type
cols <- c(3:ncol(selected))
selected[cols] <- sapply(selected[cols], as.numeric)

#draw "plot4.png"
selected$Datetime <- strptime(paste(selected$Date, selected$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

with(selected, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(selected, plot(Datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(selected, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(selected, lines(Datetime, Sub_metering_2, col = "red"))
with(selected, lines(Datetime, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

with(selected, plot(Datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power"))

dev.off()


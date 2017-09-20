#load data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep = ";", stringsAsFactors=FALSE)

#selected data on "2007-02-01" and "2007-02-02"
data$Date <- as.Date(data$Date, "%d/%m/%Y")
days <- as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d")
selected <- subset(data, data$Date %in% days)

#convert data columns to correct type
cols <- c(3:ncol(selected))
selected[cols] <- sapply(selected[cols], as.numeric)

#draw "plot2.png"
selected$Datetime <- strptime(paste(selected$Date, selected$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(selected$Datetime, selected$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

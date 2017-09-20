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

#draw "plot1.png"
png("plot1.png", width=480, height=480)
hist(selected$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

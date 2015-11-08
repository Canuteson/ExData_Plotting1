data_file <- file.path("..", "hww1", "household_power_consumption.txt")

data <- read.csv(data_file, sep = ";", na.strings = "?")

data$DateTime <- as.Date(data$Date, "%d/%m/%Y")

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

filtered_data <- data[data$DateTime >= date1 & data$DateTime <= date2,]
filtered_data$DateTime <- strptime(paste(filtered_data$DateTime, filtered_data$Time, sep = " "), 
                                   format = "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2))
with(filtered_data, {
    plot(filtered_data$DateTime, filtered_data$Global_active_power, 
         xlab = "", ylab = "Global Active Power", type = "n")
    lines(filtered_data$DateTime, filtered_data$Global_active_power)
    plot(filtered_data$DateTime, filtered_data$Voltage, 
         xlab = "datetime", ylab = "Voltage", type = "n")
    lines(filtered_data$DateTime, filtered_data$Voltage)
    plot(filtered_data$DateTime, filtered_data$Sub_metering_1, 
         xlab = "", ylab = "Energy sub metering", type = "n")
    lines(filtered_data$DateTime, filtered_data$Sub_metering_1, col = "black")
    lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col = "red")
    lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(filtered_data$DateTime, filtered_data$Global_reactive_power, 
         xlab = "datetime", ylab = "Global_reactive_power", type = "n")
    lines(filtered_data$DateTime, filtered_data$Global_reactive_power)
})
dev.off()
data_file <- file.path("..", "hww1", "household_power_consumption.txt")

data <- read.csv(data_file, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

filtered_data <- data[data$Date >= date1 & data$Date <= date2,]

png(file = "plot1.png", height = 480, width = 480)
hist(filtered_data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
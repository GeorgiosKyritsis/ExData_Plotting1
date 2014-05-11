data = read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data = data[!(data[,1] == "?" | data[, 2] == "?" | data[, 3] == "?" | data[, 4] == "?" | data[, 5] == "?" | data[, 6] == "?"
              | data[, 7] == "?" | data[, 8] == "?" | data[, 9] == "?"), ]

y = as.numeric(data[, 3])
x = 1:length(data[,1])

hist(as.numeric(data$Global_active_power), col = "red", main = 
             "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()


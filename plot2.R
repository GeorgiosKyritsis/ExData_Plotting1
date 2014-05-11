data = read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data = data[!(data[,1] == "?" | data[, 2] == "?" | data[, 3] == "?" | data[, 4] == "?" | data[, 5] == "?" | data[, 6] == "?"
              | data[, 7] == "?" | data[, 8] == "?" | data[, 9] == "?"), ]
y = as.numeric(data[, 3])
x = 1:length(data[,1])

plot(x, y, type = "l", lwd = 1, axes = FALSE, ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1, c(1, length(x)/2 + 1, length(x)), labels = c("Thu", "Fri", "Sat"))
axis(2, c(0, 2, 4, 6, 8))
box()
dev.copy(png, file = "Plot2.png", width = 480, height = 480)
dev.off()


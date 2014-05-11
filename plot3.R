data = read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data = data[66637:69516,]
data = data[!(data[,1] == "?" | data[, 2] == "?" | data[, 3] == "?" | data[, 4] == "?" | data[, 5] == "?" | data[, 6] == "?"
              | data[, 7] == "?" | data[, 8] == "?" | data[, 9] == "?"), ]

y = as.numeric(data[, 3])
x = 1:length(data[,1])

plot(x, data[, 7], type = "l", lwd = 1, axes = FALSE, ylab = "Energy sub metering", xlab = "", col = "black")
lines(x,data[, 8],col="red")
lines(x,data[, 9],col="blue")
axis(1, c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, c(0, 10, 20, 30, 40))
box()
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()
data = read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data = data[66637:69516,]
data = data[!(data[,1] == "?" | data[, 2] == "?" | data[, 3] == "?" | data[, 4] == "?" | data[, 5] == "?" | data[, 6] == "?"
              | data[, 7] == "?" | data[, 8] == "?" | data[, 9] == "?"), ]
y = as.numeric(data[, 3])
x = 1:length(data[,1])

par(mfrow = c(2,2))
plot(x, y, type = "l", lwd = 1, axes = FALSE, ylab = "Global Active Power", xlab = "")
axis(1, c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, c(0, 2, 4, 6, 8))
box()

plot(x, data[,5], type = "l", lwd = 1, axes = FALSE, ylab = "Voltage", xlab = "datetime")
axis(1, c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, c(234, 236, 238, 240, 242, 244, 246, 248))
box()

plot(x, data[, 7], type = "l", lwd = 1, axes = FALSE, ylab = "Energy sub metering", xlab = "", col = "black")
lines(x,data[, 8],col="red")
lines(x,data[, 9],col="blue")
axis(1, c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, c(0, 10, 20, 30, 40))
box()
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.6, lty = 1, bty = "n", col = c("black", "red", "blue"))

plot(x, data[,4], type = "l", lwd = 1, axes = FALSE, ylab = "Global_reactive_power", xlab = "datetime")
axis(1, c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6))
box()
dev.copy(png, file = "Plot4.png", width = 480, height = 480)
dev.off()

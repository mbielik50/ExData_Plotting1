## Read and clean data

x <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
x <- x[x$Date %in% c("1/2/2007","2/2/2007"),]
t <-strptime(paste(x$Date, x$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(t, x)



## Build Plot

columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(plotdata$t, plotdata$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(plotdata$t, plotdata$Sub_metering_2, col=columnlines[2])
lines(plotdata$t, plotdata$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")


## Save Plot

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
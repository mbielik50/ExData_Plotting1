## Read and clean data

x <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
x <- x[x$Date %in% c("1/2/2007","2/2/2007"),]
t <-strptime(paste(x$Date, x$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(t, x)


## Build Plot

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(plotdata$t, plotdata$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(plotdata$t, plotdata$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(plotdata$t, plotdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plotdata$t, plotdata$Sub_metering_2, type="l", col="red")
lines(plotdata$t, plotdata$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(plotdata$t, plotdata$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")


## Save Plot

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
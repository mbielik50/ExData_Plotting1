## Read and clean data

x <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
x <- x[x$Date %in% c("1/2/2007","2/2/2007"),]
t <-strptime(paste(x$Date, x$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(t, x)


## Build Plot

hist(plotdata$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Save Plot

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
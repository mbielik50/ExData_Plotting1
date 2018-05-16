## Read and clean data

x <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
x <- x[x$Date %in% c("1/2/2007","2/2/2007"),]
t <-strptime(paste(x$Date, x$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(t, x)

## Build Plot

plot(plotdata$Global_active_power~plotdata$t, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save Plot

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
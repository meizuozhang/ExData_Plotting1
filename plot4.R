
## download the zip file
## unzip the file and get a txt file named as "household_power_consumption.txt"

data <- read.table("./household_power_consumption.txt",header=T, sep=";")
head(data)
## substracting data only for two days
feb<- subset(data, Date=="1/2/2007"|Date=="2/2/2007")
## make sure the datatype of power is numeric
feb$Global_active_power<-as.numeric(as.character(feb$Global_active_power))
feb$Global_reactive_power<-as.numeric(as.character(feb$Global_reactive_power))
feb$Voltage<-as.numeric(as.character(feb$Voltage))
feb$Sub_metering_1<-as.numeric(as.character(feb$Sub_metering_1))
feb$Sub_metering_2<-as.numeric(as.character(feb$Sub_metering_2))
feb$Sub_metering_3<-as.numeric(as.character(feb$Sub_metering_3))
feb$Date<- as.Date(feb$Date, format="%d/%m/%Y")
## note that in the as.Date, need to used capitalized "Y"
## create a timestamp to capture the date and time info together
feb<- transform(feb, timestamp=as.POSIXct(paste(Date, Time)))
## combining 4 plots
par(mfrow=c(2,2))
## create plot 1
plot(feb$timestamp,feb$Global_active_power,xlab="", ylab="Global Active Power", type="l")
## plot 2
plot(feb$timestamp,feb$Voltage,xlab="datetime", ylab="Voltage", type="l")
## plot 3
plot(feb$timestamp,feb$Sub_metering_1,xlab="", ylab="Energy Sub Metering", type="l")
lines(feb$timestamp,feb$Sub_metering_2, col="red")
lines(feb$timestamp,feb$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1), bty="n", cex = 0.25)
## plot 4
plot(feb$timestamp,feb$Global_reactive_power,xlab="datetime", ylab="Global Active Power", type="l")
## save the plot to a PNG file

dev.copy(png, filename="plot4.png", width=480, height=480)
dev.off()

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
feb$Date<- as.Date(feb$Date, format="%d/%m/%Y")
## note that in the as.Date, need to used capitalized "Y"
## create a timestamp to capture the date and time info together
feb<- transform(feb, timestamp=as.POSIXct(paste(Date, Time)))
## create plot

plot(feb$timestamp,feb$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)", type="l")
## save the plot to a PNG file

dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off()

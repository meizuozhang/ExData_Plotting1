## download the zip file
## unzip the file and get a txt file named as "household_power_consumption.txt"

data <- read.table("./household_power_consumption.txt",header=T, sep=";")
head(data)
## substracting data only for two days
feb<- subset(data, Date=="1/2/2007"|Date=="2/2/2007")
## make sure the datatype of power is numeric
feb$Global_active_power<-as.numeric(as.character(feb$Global_active_power))
## make sure the color of histogram is as red
hist(feb$Global_active_power, main="Globle Active Power",col="red", xlab="Global Active Power(killowatts)")
## save the plot to a PNG file

dev.copy(png, filename="plot1.png", width=480, height=480)
dev.off()

   
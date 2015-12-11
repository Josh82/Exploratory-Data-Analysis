powerconsumption<-read.csv.sql("C:/Users/youngj/downloads/household_power_consumption.txt",
                               sql="select* from file WHERE Date in  ('1/2/2007', '2/2/2007')", header=TRUE, sep=";")
powerconsumption$NewDate <- as.POSIXct(paste(powerconsumption$Date, powerconsumption$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(powerconsumption$NewDate, powerconsumption$Global_active_power, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

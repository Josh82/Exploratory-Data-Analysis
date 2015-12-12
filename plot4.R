library(sqldf)
powerconsumption<-read.csv.sql("C:/Users/youngj/downloads/household_power_consumption.txt",
                               sql="select* from file WHERE Date in  ('1/2/2007', '2/2/2007')", header=TRUE, sep=";")
powerconsumption$NewDate <- as.POSIXct(paste(powerconsumption$Date, powerconsumption$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
with(powerconsumption, {
  plot(powerconsumption$NewDate, powerconsumption$Global_active_power, type ="l", xlab="", ylab="Global Active Power")
  plot(powerconsumption$NewDate, powerconsumption$Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(powerconsumption$NewDate, powerconsumption$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="")
    lines(powerconsumption$NewDate, powerconsumption$Sub_metering_2, col ="red")
    lines(powerconsumption$NewDate, powerconsumption$Sub_metering_3, col = "blue")
    legend("topright", pch ="_", col =c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           bty="n", cex=0.8, text.width = strwidth("           "))
  plot(powerconsumption$NewDate, powerconsumption$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power")
  
})
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
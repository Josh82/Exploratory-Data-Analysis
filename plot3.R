library(sqldf)
powerconsumption<-read.csv.sql("C:/Users/youngj/downloads/household_power_consumption.txt",
                               sql="select* from file WHERE Date in  ('1/2/2007', '2/2/2007')", header=TRUE, sep=";")
powerconsumption$NewDate <- as.POSIXct(paste(powerconsumption$Date, powerconsumption$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(powerconsumption$NewDate, powerconsumption$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="")
  lines(powerconsumption$NewDate, powerconsumption$Sub_metering_2, col ="red")
  lines(powerconsumption$NewDate, powerconsumption$Sub_metering_3, col = "blue")
legend("topright", pch ="_", col =c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()

library(sqldf)
powerconsumption<-read.csv.sql("C:/Users/youngj/downloads/household_power_consumption.txt",
                               sql="select* from file WHERE Date in  ('1/2/2007', '2/2/2007')", header=TRUE, sep=";")
hist(powerconsumption$Global_active_power, col = "red", main = "Global Active Power", 
      xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

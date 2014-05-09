myData =  read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".")

myData$DateTime <- strptime(paste(myData$Date, myData$Time, sep=" ") , "%d/%m/%Y %H:%M:%OS")
myData$Date = as.Date(myData$Date, "%d/%m/%Y")


rData <- subset(myData, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
rData$Global_active_power <- as.numeric(gsub (",", ".", as.character(rData$Global_active_power)))
rData$Sub_metering_1 <- as.numeric(gsub (",", ".", as.character(rData$Sub_metering_1)))
rData$Sub_metering_2 <- as.numeric(gsub (",", ".", as.character(rData$Sub_metering_2)))
rData$Sub_metering_3 <- as.numeric(gsub (",", ".", as.character(rData$Sub_metering_3)))
rData$Global_reactive_power <- as.numeric(gsub (",", ".", as.character(rData$Global_reactive_power)))
rData$Voltage <- as.numeric(gsub (",", ".", as.character(rData$Voltage)))


png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))
plot(rData$Global_active_power, type="l", ylab="Global Active Power",xaxt="n",xlab="")
axis(1,at=c(1,1440,2880),c("Thu", "Fri", "Sat"))


plot(rData$Voltage, type="l", ylab="Voltage",xaxt="n",xlab="datetime")
axis(1,at=c(1,1440,2880),c("Thu", "Fri", "Sat"))


plot(rData$Sub_metering_1, type="l", ylab="Energy sub metering",xaxt="n",xlab="")
points(rData$Sub_metering_2, type="l", col="red")
points(rData$Sub_metering_3, type="l", col="blue")
axis(1,at=c(1,1440,2880),c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue"), bty ="n")


plot(rData$Global_reactive_power, type="l", ylab="Global_reactive_power",xaxt="n",xlab="datetime")
axis(1,at=c(1,1440,2880),c("Thu", "Fri", "Sat"))


dev.off()

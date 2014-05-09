myData =  read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".")

myData$DateTime <- strptime(paste(myData$Date, myData$Time, sep=" ") , "%d/%m/%Y %H:%M:%OS")
myData$Date = as.Date(myData$Date, "%d/%m/%Y")


rData <- subset(myData, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
rData$Sub_metering_1 <- as.numeric(gsub (",", ".", as.character(rData$Sub_metering_1)))
rData$Sub_metering_2 <- as.numeric(gsub (",", ".", as.character(rData$Sub_metering_2)))
rData$Sub_metering_3 <- as.numeric(gsub (",", ".", as.character(rData$Sub_metering_3)))


png(filename = "plot3.png",width = 480, height = 480)
plot(rData$Sub_metering_1, type="l", ylab="Energy sub metering",xaxt="n",xlab="")
points(rData$Sub_metering_2, type="l", col="red")
points(rData$Sub_metering_3, type="l", col="blue")
axis(1,at=c(1,1440,2880),c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue"))
dev.off()

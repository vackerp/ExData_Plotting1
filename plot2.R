
myData =  read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".")

myData$DateTime <- strptime(paste(myData$Date, myData$Time, sep=" ") , "%d/%m/%Y %H:%M:%OS")
myData$Date = as.Date(myData$Date, "%d/%m/%Y")


rData <- subset(myData, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
rData$Global_active_power <- as.numeric(gsub (",", ".", as.character(rData$Global_active_power)))


png(filename = "plot2.png",width = 480, height = 480)
plot(rData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")
axis(1,at=c(1,1440,2880),c("Thu", "Fri", "Sat"))
dev.off()

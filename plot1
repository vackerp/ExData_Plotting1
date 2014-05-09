myData =  read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".")

myData$DateTime <- strptime(paste(myData$Date, myData$Time, sep=" ") , "%d/%m/%Y %H:%M:%OS")
myData$Date = as.Date(myData$Date, "%d/%m/%Y")


rData <- subset(myData, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
rData$Global_active_power <- as.numeric(gsub (",", ".", as.character(rData$Global_active_power)))


png(filename = "plot1.png",width = 480, height = 480)
hist(rData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

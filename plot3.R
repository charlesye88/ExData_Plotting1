rawdata <- data.table::fread("household_power_consumption.txt")

## Data Format Conversion
rawdata$Date <- as.Date(rawdata$Date,format = "%d/%m/%Y")
rawdata$Global_active_power <- as.numeric(rawdata$Global_active_power)
rawdata[,DateTime:= strptime(paste(Date,Time),format = "%Y-%m-%d %H:%M:%S")]
rawdata$Sub_metering_1 <- as.numeric(rawdata$Sub_metering_1)
rawdata$Sub_metering_2 <- as.numeric(rawdata$Sub_metering_2)
rawdata$Sub_metering_3 <- as.numeric(rawdata$Sub_metering_3)


##Subset Data
subsetdata <- subset(rawdata,Date=="2007-02-02"|Date =="2007-02-01")

##Plot
png("plot3.png",width = 480,height = 480)

plot(subsetdata$DateTime,subsetdata$Sub_metering_1,col ="black",type = "l",
     xlab = "",ylab = "Energy sub metering")
lines(subsetdata$DateTime,subsetdata$Sub_metering_2,col ="red")
lines(subsetdata$DateTime,subsetdata$Sub_metering_3,col ="blue")
legend("topright",col = c("black","red","blue"),
       legend = colnames(subsetdata)[7:9],
       lty = 1,
       lwd =2.5)
       
       
       
colnames(subsetdata)[7:9]

dev.off()

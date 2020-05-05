

## Read Data 
rawdata <- data.table::fread("household_power_consumption.txt")

## Data Format Conversion
rawdata$Date <- as.Date(rawdata$Date,format = "%d/%m/%Y")
rawdata$Global_active_power <- as.numeric(rawdata$Global_active_power)
rawdata[,DateTime:= strptime(paste(Date,Time),format = "%Y-%m-%d %H:%M:%S")]


##Subset Data
subsetdata <- subset(rawdata,Date=="2007-02-02"|Date =="2007-02-01")

##Plot
png("plot2.png",width = 480,height = 480)

plot(x= subsetdata$DateTime,y= subsetdata$Global_active_power,type="l", 
ylab = "Global Active Power(kilowatts)",xlab = "")

dev.off()


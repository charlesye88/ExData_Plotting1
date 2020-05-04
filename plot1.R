library(data.table)

## Read Data 
rawdata <- data.table::fread("household_power_consumption.txt")
## Covert to Date Format
rawdata$Date <- as.Date(rawdata$Date,format = "%d/%m/%Y")
rawdata$Global_active_power <- as.numeric(rawdata$Global_active_power)
##Subset Data
subsetdata <- subset(rawdata,Date=="2007-02-02"|Date =="2007-02-01")

##Plot
png("plot1.png",width = 480,height = 480)

hist(subsetdata$Global_active_power,col= "Red",main="Global Active Power",xlab ="Global Active Power(kilowatts)")

dev.off()
## set working directory
setwd("E:/DataScienceR/module_4_w1/")
## load the data
pdata<-read.table("household_power_consumption.txt",skip=1,header = FALSE,na.strings = "?",sep = ";")

## define and rename variables
varNames<-c("Date","Time","Global_active_power","Global_reactive_power",
            "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(pdata)<-varNames

## subset the data
psubdata<-subset(pdata, Date %in% c("1/2/2007","2/2/2007"))


## create a new column and assign datetime variable
psubdata[,"DateTime"]<-as.POSIXct(paste(psubdata$Date,psubdata$Time),format = "%d/%m/%Y %H:%M:%S")


## initialize a graphic device
png(filename = "plot2.png",width = 480,height = 480)

## plot to graphic device
yval<-psubdata$Global_active_power
xval<-psubdata$DateTime
plot(xval,yval,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()
## set working directory
setwd("E:/DataScienceR/module_4_w1/")
## load the data
pdata<-read.table("household_power_consumption.txt",skip=1,header = FALSE,na.strings = "?",sep = ";")

varNames<-c("Date","Time","Global_active_power","Global_reactive_power",
            "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(pdata)<-varNames




## subset the data
psubdata<-subset(pdata, Date %in% c("1/2/2007","2/2/2007"))

## convert date column to date format
psubdata$Date<-as.Date(psubdata$Date, format="%d/%m/%Y")

## initialize a graphic device
png(filename = "plot1.png",width = 480,height = 480)

## plot histogram and send to graphic device
hval<-psubdata$Global_active_power
hist(hval,main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab="Frequency",col = "Red")
dev.off()




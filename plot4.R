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
png(filename = "plot4.png",width = 480,height = 480)

## initialize plot parameters
par(mfrow=c(2,2))

## assign plot variables
gpwrA<-psubdata$Global_active_power
gpwrR<-psubdata$Global_reactive_power
vlt<-psubdata$Voltage
yval1<-psubdata$Sub_metering_1
yval2<-psubdata$Sub_metering_2
yval3<-psubdata$Sub_metering_3
xval<-psubdata$DateTime
## start plotting
# plot 1
plot(xval,gpwrA,type = "l",ylab = "Global Active Power",xlab = "")

# plot 2
plot(xval,vlt,type = "l",ylab = "Voltage",xlab = "datetime")

# plot 3
plot(xval,yval1,type = "l",ylab = "Energy sub metering",xlab = "Days")
lines(xval,yval2,col="Red")
lines(xval,yval3,col="Blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1,1)
       ,lwd = c(2,2,2)
       , bty="n"
       , cex=1) 

# plot 4
plot(xval,gpwrR,type = "l",ylab = "Global_reactive_power",xlab = "datetime")
dev.off()
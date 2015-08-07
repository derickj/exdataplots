inpfile<-"household_power_consumption.txt"
    if(!file.exists(inpfile)) {
        msg<-paste(inpfile, "does not exist", sep=" ")
        stop(msg)
    }
thedata<-read.table(inpfile, sep=";", header=TRUE, na.strings="?",stringsAsFactors=FALSE)
reldata<-thedata[thedata$Date=="1/2/2007"|thedata$Date=="2/2/2007",]
dates<-paste(reldata$Date,reldata$Time,sep=" ")
reldata$datetime<-strptime(dates,"%d/%m/%Y %H:%M:%S")
png(filename="plot4.png")
par(mfrow=c(2,2))
# Topleft
plot(reldata$datetime,reldata$Global_active_power,type="l",xlab="", ylab="Global Active Power")
# Topright
plot(reldata$datetime,reldata$Voltage,type="l",ylab="Voltage",xlab="datetime")
# Bottom Left
with (reldata,(plot(datetime,Sub_metering_1,type="l",xlab="", ylab="Energy Sub Metering")))
with (reldata, points(datetime, Sub_metering_2, type="l",col="red"))
with (reldata, points(datetime, Sub_metering_3, type="l",col="blue"))
legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Bottom right
plot(reldata$datetime,reldata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
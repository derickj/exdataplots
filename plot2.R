inpfile<-"household_power_consumption.txt"
    if(!file.exists(inpfile)) {
        msg<-paste(inpfile, "does not exist", sep=" ")
        stop(msg)
    }
thedata<-read.table(inpfile, sep=";", header=TRUE, na.strings="?",stringsAsFactors=FALSE)
reldata<-thedata[thedata$Date=="1/2/2007"|thedata$Date=="2/2/2007",]
dates<-paste(reldata$Date,reldata$Time,sep=" ")
reldata$datetime<-strptime(dates,"%d/%m/%Y %H:%M:%S")
png(filename="plot2.png")
plot(reldata$datetime,reldata$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

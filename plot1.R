inpfile<-"household_power_consumption.txt"
    if(!file.exists(inpfile)) {
        msg<-paste(inpfile, "does not exist", sep=" ")
        stop(msg)
    }
thedata<-read.table(inpfile, sep=";", header=TRUE, na.strings="?",stringsAsFactors=FALSE)
reldata<-thedata[thedata$Date=="1/2/2007"|thedata$Date=="2/2/2007",]
# thedata$Date<-as.Date(thedata$Date,"%d/%m/%Y")
# reldata<-thedata[thedata$Date==as.Date("2007-02-01")|thedata$Date==as.Date("2007-02-02"),]
png(filename="plot1.png")
hist(reldata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

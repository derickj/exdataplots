##
## Test whether the input file exists in the current working directory.
## If not, display error message and terminate
##
inpfile<-"household_power_consumption.txt"
    if(!file.exists(inpfile)) {
        msg<-paste(inpfile, "does not exist", sep=" ")
        stop(msg)
    }
##
## Read the data from the file and select the relevant days' data
##
thedata<-read.table(inpfile, sep=";", header=TRUE, na.strings="?",stringsAsFactors=FALSE)
reldata<-thedata[thedata$Date=="1/2/2007"|thedata$Date=="2/2/2007",]
##
## Convert the date and time string fields to a POSIX time field, add values as a column called
## "datetime" to the table
##
dates<-paste(reldata$Date,reldata$Time,sep=" ")
reldata$datetime<-strptime(dates,"%d/%m/%Y %H:%M:%S")
##
## Create the required 4 plots in a png file in the current working directory
##
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
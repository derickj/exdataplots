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
## Create the plot in a png file in the current working directory
##
png(filename="plot1.png")
hist(reldata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

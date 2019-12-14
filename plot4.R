library(sqldf)

file_1="./Module_4/household_power_consumption.txt"
data<-read.csv.sql(file_1, "select * from file where Date='1/2/2007'
                   or Date='2/2/2007' ", sep=";")

data$TimeStamp<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

with(data,plot(TimeStamp,Global_active_power,type="l",xlab="",
               ylab="Global Active Power (kilowatts)"))

with(data,plot(TimeStamp,Voltage,type="l",xlab="datetime",
               ylab="Voltage"))

with(data,plot(TimeStamp,Sub_metering_1,type="l",xlab="",
               ylab="Energy sub metering"))
points(data$TimeStamp,data$Sub_metering_2,col="red",type="l")
points(data$TimeStamp,data$Sub_metering_3,col="blue",type="l")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data,plot(TimeStamp,Global_reactive_power,type="l",xlab="datetime",
               ylab="Global_reactive_power"))

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()

#install.packages("sqldf")

library(sqldf)

file_1="./Module_4/household_power_consumption.txt"
data<-read.csv.sql(file_1, "select * from file where Date='1/2/2007'
                   or Date='2/2/2007' ", sep=";")

data$TimeStamp<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

with(data,plot(TimeStamp,Sub_metering_1,type="l",xlab="",
               ylab="Energy sub metering"))

points(data$TimeStamp,data$Sub_metering_2,col="red",type="l")
points(data$TimeStamp,data$Sub_metering_3,col="blue",type="l")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()


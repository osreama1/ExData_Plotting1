
#install.packages("sqldf")

library(sqldf)

file_1="./Module_4/household_power_consumption.txt"
data<-read.csv.sql(file_1, "select * from file where Date='1/2/2007'
                   or Date='2/2/2007' ", sep=";")

data$TimeStamp<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

with(data,plot(TimeStamp,Global_active_power,type="l",xlab="",
               ylab="Global Active Power (kilowatts)"))

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()


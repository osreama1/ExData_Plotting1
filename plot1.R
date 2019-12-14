
#install.packages("sqldf")

library(sqldf)

file_1="./Module_4/household_power_consumption.txt"
data<-read.csv.sql(file_1, "select * from file where Date='1/2/2007'
                   or Date='2/2/2007' ", sep=";")

hist(data$Global_active_power,col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()


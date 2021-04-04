if(!dir.exists("./exploratory-data-analysis/week1")){dir.create("./exploratory-data-analysis/week1")}
setwd("./exploratory-data-analysis/week1")

library(dplyr)
library(stringr)

# read data to R 
data<-read.table("household_power_consumption.txt",sep = ";",header = T)
test<-as.Date(data$Date)

#obtain data on"1/2/2007","2/2/2007"
my_data<-subset(data, Date %in% c("1/2/2007","2/2/2007"))



#remove missing data for global active power 
my_data1<-my_data[my_data$Sub_metering_1!='?',]
my_sub_metering_1<-my_data1$Sub_metering_1
#string connect with date and time
test<-paste(my_data1$Date,my_data1$Time)
#convert string to time 
test1<-strptime(test, "%d/%m/%Y %H:%M:%S")


#produce plot for sub_metering_1 in black
plot(test1,my_sub_metering_1, type='l', ylab='Energy sub metering')

#remove missing data for global active power 
my_data2<-my_data[my_data$Sub_metering_2!='?',]
my_sub_metering_2<-my_data2$Sub_metering_2
#string connect with date and time
test<-paste(my_data3$Date,my_data2$Time)
#convert string to time 
test2<-strptime(test, "%d/%m/%Y %H:%M:%S")

#produce plot for sub_metering_2 in red 
lines(test2,my_sub_metering_2,type='l',col="red")

#remove missing data for global active power 
my_data3<-my_data[my_data$Sub_metering_3!='?',]
my_sub_metering_3<-my_data3$Sub_metering_3
#string connect with date and time
test<-paste(my_data3$Date,my_data3$Time)
#convert string to time 
test3<-strptime(test, "%d/%m/%Y %H:%M:%S")

#produce plot for sub_metering_2 in blue 
lines(test3,my_sub_metering_3,type='l',col="blue")

#produce legend 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black", "red","blue"),lty=1, cex=0.8)

#egend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
#       col=c("black", "red","blue"))

#copy screen to plot1.pgn
dev.copy(png,'plot3.png')
#close device 
dev.off()

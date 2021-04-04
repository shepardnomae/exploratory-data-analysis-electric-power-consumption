if(!dir.exists("./exploratory-data-analysis/week1")){dir.create("./exploratory-data-analysis/week1")}
setwd("./exploratory-data-analysis/week1")
library(dplyr)
library(stringr)

# read data to R 
data<-read.table("household_power_consumption.txt",sep = ";",header = T)
test<-as.Date(data$Date)

#obtain data on"1/2/2007","2/2/2007"
my_data<-subset(data, Date %in% c("1/2/2007","2/2/2007"))


#string connect with date and time
test<-paste(my_data$Date,my_data$Time)


#convert string to time 
test3<-strptime(test, "%d/%m/%Y %H:%M:%S")

#remove missing data for global active power 
my_data2<-my_data[my_data$Global_active_power!='?',]

with(my_data2, plot(test3,Global_active_power, type='l', ylab='Global active power (kilowatts)'))

#copy screen to plot1.pgn
dev.copy(png,'plot2.png')
#close device 
dev.off()

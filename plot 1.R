if(!dir.exists("./exploratory-data-analysis/week1")){dir.create("./exploratory-data-analysis/week1")}
setwd("./exploratory-data-analysis/week1")

library(dplyr)
library(stringr)

# read data to R 
data<-read.table("household_power_consumption.txt",sep = ";",header = T)
test<-as.Date(data$Date)

#obtain data on"1/2/2007","2/2/2007"
my_data<-subset(data, Date %in% c("1/2/2007","2/2/2007"))

#produce histogram in red 
hist(as.numeric(my_data$Global_active_power), col="red", main="Gloabal Active Power",xlab='Global active power (kilowatts)')

#copy screen to plot1.pgn
dev.copy(png,'plot1.png')
#close device 
dev.off()


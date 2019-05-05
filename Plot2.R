## Plot1 Code
## Exploritory Data Analysis - Peer-graded Assignment: Course Project 1
## Greg Ricci


## The Dataset Dataset: Electric power consumption [20Mb] 
## was downloaded and unzipped to local directory due to size
getwd()
setwd("C:/Users/Anthony/Documents/Coursera/ExpDataC4")

xdata<- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE) # pull september data

xdata$Date<-as.Date(xdata$Date,format="%d/%m/%Y")

subextract<-xdata[(xdata$Date=="2007-02-01") | (xdata$Date=="2007-02-02"),]

head(subextract)
dim(subextract)
summary(subextract)
View(subextract)

## Data clarifications 
subextract$Global_active_power<-suppressWarnings(as.numeric(subextract[,"Global_active_power"]))
subextract$Global_reactive_power <- suppressWarnings(as.numeric(subextract[,"Global_reactive_power"]))
subextract$Voltage <- suppressWarnings(as.numeric(subextract[,"Voltage"]))
subextract$Sub_metering_1<-suppressWarnings(as.numeric(subextract[,"Sub_metering_1"]))
subextract$Sub_metering_2<-suppressWarnings(as.numeric(subextract[,"Sub_metering_2"]))
subextract$Sub_metering_3<-suppressWarnings(as.numeric(subextract[,"Sub_metering_3"]))

## remove NA varaiables
library("dplyr", lib.loc="~/R/win-library/3.5")
xdataF <- filter(subextract, Global_active_power|NA)
View(xdataF)
# Date-time format
datet<-strptime(paste(subextract$Date,subextract$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
#
xdataF$Global_active_power<-suppressWarnings(as.numeric(xdataF[,"Global_active_power"]))
xdataF$Global_reactive_power <- suppressWarnings(as.numeric(xdataF[,"Global_reactive_power"]))
xdataF$Voltage <- suppressWarnings(as.numeric(xdataF[,"Voltage"]))
xdataF$Sub_metering_1<-suppressWarnings(as.numeric(xdataF[,"Sub_metering_1"]))
xdataF$Sub_metering_2<-suppressWarnings(as.numeric(xdataF[,"Sub_metering_2"]))
xdataF$Sub_metering_3<-suppressWarnings(as.numeric(xdataF[,"Sub_metering_3"]))
## Create Plots

#plot1 <- function() {
#  hist(xdataF$Global_active_power,main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
#  dev.copy(png, file="plot1.png", width=480, height=480)
#  dev.off()
#  cat("Plot1.png has been saved in", getwd())
#}
#plot1()

##plot2
plot2 <- function() {
  plot(datet,xdataF$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')
  dev.copy(png, file="plot2.png", width=480, height=480, units = 'px')
  dev.off()
  cat("plot2.png has been saved in", getwd())
}
plot2()


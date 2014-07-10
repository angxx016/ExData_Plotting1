setwd("~/Dropbox/Study/Coursera/Exploratory")
household_power_consumption=read.csv("~/Dropbox/Study/Coursera/Exploratory/household_power_consumption.txt", sep=";")

lct <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
household_power_consumption$Date=as.character(household_power_consumption$Date)
household_power_consumption$Date=strptime(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption$Date=as.Date(household_power_consumption$Date,"%Y-%m-%d")
new=subset(household_power_consumption,Date=="2007-02-01" | Date=="2007-02-02") 

new$Global_active_power=as.matrix(new$Global_active_power)
new$Global_active_power=as.numeric(new$Global_active_power)

new$Date=as.character(new$Date)
new$Time=as.character(new$Time)
new$Time=paste(new$Date, new$Time)
new$Time=strptime(new$Time,"%Y-%m-%d %H:%M:%S")

sm1=as.matrix(new$Sub_metering_1)
new$Sub_metering_1=as.numeric(sm1)
sm2=as.matrix(new$Sub_metering_2)
new$Sub_metering_2=as.numeric(sm2)
sm3=as.matrix(new$Sub_metering_3)
new$Sub_metering_3=as.numeric(sm3)

new$Voltage=as.matrix(new$Voltage)
new$Voltage=as.numeric(new$Voltage)

new$Global_reactive_power=as.matrix(new$Global_reactive_power)
new$Global_reactive_power=as.numeric(new$Global_reactive_power)


#1
png("plot1.png",width=480,height=480)
hist(new$Global_active_power,xlab="Global Active Power (kilowatts)",main = "Global Active Power",col="red")
dev.off()
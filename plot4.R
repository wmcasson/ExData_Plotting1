# Reads electric power consumption data and creates
# a combination of four plots for energy consumption variables

library(data.table)

filename <- "household_power_consumption.txt"
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")

pwr_dt <- read.table(filename,sep=";",header=T,na.strings=c("?"))
pwr_dt$Date <- as.Date(pwr_dt$Date,format="%d/%m/%Y")
pwr_dt <- pwr_dt[pwr_dt$Date >= start_date & pwr_dt$Date <= end_date,]
pwr_dt$datetime <- as.POSIXct(paste(pwr_dt$Date,pwr_dt$Time),format="%Y-%m-%d %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))
plot(pwr_dt[,c("datetime","Global_active_power")],type="l",
     main=NA,ylab="Global Active Power (kilowatts)",xlab=NA)
plot(pwr_dt[,c("datetime","Voltage")],type="l",
     main=NA,ylab="Global Active Power (kilowatts)")
plot(pwr_dt[,c("datetime","Sub_metering_1")],type="l",
     main=NA,ylab="Energy sub metering",xlab=NA)
lines(pwr_dt[,c("datetime","Sub_metering_2")],col="red")
lines(pwr_dt[,c("datetime","Sub_metering_3")],col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),col=c("black","red","blue"))
plot(pwr_dt[,c("datetime","Global_reactive_power")],type="l",main=NA)
dev.off()
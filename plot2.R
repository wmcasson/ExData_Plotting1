# Reads electric power consumption data and creates
# a time-series line graph for global active power

library(data.table)

filename <- "household_power_consumption.txt"
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")

pwr_dt <- read.table(filename,sep=";",header=T,na.strings=c("?"))
pwr_dt$Date <- as.Date(pwr_dt$Date,format="%d/%m/%Y")
pwr_dt <- pwr_dt[pwr_dt$Date >= start_date & pwr_dt$Date <= end_date,]
pwr_dt$datetime <- as.POSIXct(paste(pwr_dt$Date,pwr_dt$Time),format="%Y-%m-%d %H:%M:%S")

png("plot2.png")
plot(pwr_dt[,c("datetime","Global_active_power")],type="l",
     main=NA,ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()
# Reads electric power consumption data and creates
# a frequency plot for global active power

library(data.table)

filename <- "household_power_consumption.txt"
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")

pwr_dt <- read.table(filename,sep=";",header=T,na.strings=c("?"))

pwr_dt$Date <- as.Date(pwr_dt$Date,format="%d/%m/%Y")

pwr_dt <- pwr_dt[pwr_dt$Date >= start_date & pwr_dt$Date <= end_date,]

png("plot1.png")
hist(pwr_dt$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
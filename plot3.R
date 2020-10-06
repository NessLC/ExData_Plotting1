consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                          colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(consumption)
consumption$Date<-as.Date(consumption$Date, "%d/%m/%Y")
consumption <- subset(consumption,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
consumption <- consumption[complete.cases(consumption),]
consumption$datetime<- as.POSIXct( paste(consumption$Date, consumption$Time))

with(consumption, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
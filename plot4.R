consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                          colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(consumption)
consumption$Date<-as.Date(consumption$Date, "%d/%m/%Y")
consumption <- subset(consumption,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
consumption <- consumption[complete.cases(consumption),]
consumption$datetime<- as.POSIXct( paste(consumption$Date, consumption$Time))

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(consumption, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",cex=0.5,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
#cex<1 sugerencia del revisor poner eso como argumento en legend
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                          colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(consumption)
consumption$Date<-as.Date(consumption$Date, "%d/%m/%Y")
consumption <- subset(consumption,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
consumption <- consumption[complete.cases(consumption),]
consumption$datetime<- as.POSIXct( paste(consumption$Date, consumption$Time))
plot(consumption$Global_active_power~consumption$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
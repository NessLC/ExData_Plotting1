if(!file.exists("./downloaddata.zip")){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile = "./downloaddata.zip")
  zipF<- "./downloaddata.zip"
  outDir<-"./"
  unzip(zipF,exdir=outDir)
}
consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(consumption)
consumption$Date<-as.Date(consumption$Date, "%d/%m/%Y")
consumption <- subset(consumption,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
consumption <- consumption[complete.cases(consumption),]
hist(consumption$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
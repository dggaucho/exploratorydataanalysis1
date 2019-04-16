#Read data file
setwd("C:/Users/Diego.GarciaLopez/Google Drive/Coursera/Course 4 - Exploratory Data Analysis/")
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datafiltered <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert values for plot as numeric
datafiltered$Global_active_power <- as.numeric(datafiltered$Global_active_power)
datafiltered$Sub_metering_1 <- as.numeric(datafiltered$Sub_metering_1)
datafiltered$Sub_metering_2 <- as.numeric(datafiltered$Sub_metering_2)
datafiltered$Sub_metering_3 <- as.numeric(datafiltered$Sub_metering_3)

##Format Date
datafiltered$Date <- as.Date(datafiltered$Date,format = "%d/%m/%Y")
datafiltered$DateTime<-as.POSIXct(paste(as.Date(datafiltered$Date),datafiltered$Time))

##plot graph into png file 480 by 480 pixels
png("plot3.png",width = 480,height = 480)

with(datafiltered, 
     {
       plot(Sub_metering_1~DateTime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
       lines(Sub_metering_2~DateTime,col='Red')
       lines(Sub_metering_3~DateTime,col='Blue')
     }   
  )

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
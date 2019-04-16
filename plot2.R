#Read data file
setwd("C:/Users/Diego.GarciaLopez/Google Drive/Coursera/Course 4 - Exploratory Data Analysis/")
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datafiltered <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert Global Active Power as numeric
datafiltered$Global_active_power <- as.numeric(datafiltered$Global_active_power)

##Format Date
datafiltered$Date <- as.Date(datafiltered$Date,format = "%d/%m/%Y")
datafiltered$DateTime<-as.POSIXct(paste(as.Date(datafiltered$Date),datafiltered$Time))

##plot graph into png file 480 by 480 pixels
png("plot2.png",width = 480,height = 480)

with(datafiltered, 
     plot(Global_active_power~DateTime,
      type="l",
      ylab="Global Active Power (kilowatts)",
      xlab="")
      )

dev.off()
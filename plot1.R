setwd("C:/Users/Diego.GarciaLopez/Google Drive/Coursera/Course 4 - Exploratory Data Analysis/")
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datafiltered <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot1.png",width = 480,height = 480)
hist(as.numeric(datafiltered$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts")
dev.off()
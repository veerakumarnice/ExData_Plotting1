#load the data.table library
library(data.table)

#read the data from the file
powerData <- fread("household_power_consumption.txt", stringsAsFactors = TRUE, na.strings = "?")

#subset the required date to form tidy data
dataT <- data.frame(subset(powerData, Date == "1/2/2007" | Date == "2/2/2007"))

#convert the date and time string to data formate using strptime
dataT$FullTime <- strptime(paste(dataT$Date, dataT$Time), format = "%d/%m/%Y %H:%M:%S", tz = "")

par(mfrow = c(1,1))

#plot the required data
with(dataT, plot(FullTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#copy the image to the png file
dev.copy(png, "plot2.png")
dev.off()

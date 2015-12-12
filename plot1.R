#load the data.table library
library(data.table)

#read the data from the file
powerData <- fread("household_power_consumption.txt", stringsAsFactors = TRUE, na.strings = "?")

#subset the required date to form tidy data
dataT <- data.frame(subset(powerData, Date == "1/2/2007" | Date == "2/2/2007"))

#convert the date and time string to data formate using strptime
dataT$FullTime <- strptime(paste(dataT$Date, dataT$Time), format = "%d/%m/%Y %H:%M:%S", tz = "")

par(mfrow = c(1,1))

#draw the histogram
hist(dataT$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)" ,ylab = "Frequency", main = "Global Active Power")

#copy the image to the png file
dev.copy(png, "plot1.png")
dev.off()

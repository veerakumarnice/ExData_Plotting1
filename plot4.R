#load the data.table library
library(data.table)

#read the data from the file
powerData <- fread("household_power_consumption.txt", stringsAsFactors = TRUE, na.strings = "?")

#subset the required date to form tidy data
dataT <- data.frame(subset(powerData, Date == "1/2/2007" | Date == "2/2/2007"))

#convert the date and time string to data formate using strptime
dataT$FullTime <- strptime(paste(dataT$Date, dataT$Time), format = "%d/%m/%Y %H:%M:%S", tz = "")

par(mfrow = c(2,2))

with ( dataT,  {
        
        #plot the global active power graph
        plot(FullTime, Global_active_power, type = "l", xlab = "",ylab = "Global Active Power")
        
        #plot the voltage graph
        plot(FullTime, Voltage, type = "l", xlab = "datetime", ylab = "Volatage")
        
        #plot the sub metering graph
        plot(FullTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub metering")
        lines(FullTime, Sub_metering_1, type = "l")
        lines(FullTime, Sub_metering_2, type = "l", col = "red")
        lines(FullTime, Sub_metering_3, type = "l", col = "blue")
        legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue") , lwd = 1, cex = 0.5)
        
        #plot the global reactive power graph        
        plot(FullTime, Global_reactive_power, type = "l", xlab = "datetime" )
        
})

#copy the image to the png file
dev.copy(png, "plot4.png")
dev.off()

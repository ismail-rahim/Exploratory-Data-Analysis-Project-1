
##plot 4


#set the working directory
setwd("D:\\Git\\Exploratory Data Analysis")

# Read the text file using read.table function
data = read.table("household_power_consumption.txt", header = T, sep =";", na.strings="?", stringsAsFactors = FALSE)

#Extract data within date range
dataSelected = subset (data, data$Date %in% c("1/2/2007","2/2/2007"))

# concat data and time to form new variable
dataSelected$datetime <- paste(dataSelected$Date, dataSelected$Time)

# convert to date/time class
dataSelected$datetime <- strptime(dataSelected$datetime, "%d/%m/%Y %H:%M:%S" )

#Initialize graphics device of png file format
png("plot4.png", height=480, width=480, bg="transparent", type="windows")

# set the parameters to plot 2 by 2 and smallest text symbols
par(mfrow = c(2,2), cex = 0.8)

## From plot 2
plot(dataSelected$datetime, dataSelected$Global_active_power, type="l", ylab="Global Active Power", xlab="")

## Plot the voltage graph
plot(dataSelected$datetime, dataSelected$Voltage, type="l", ylab="Voltage", xlab="datetime")


## From Plot 3
#Plot the graph
plot(dataSelected$datetime,dataSelected$Sub_metering_1, type="l", ylab="Energy sub Metering", xlab="", col = "black")

#Add red line graph
lines(dataSelected$datetime,dataSelected$Sub_metering_2, col="red")

#Add blue line graph
lines(dataSelected$datetime,dataSelected$Sub_metering_3, col="blue")

#Include legend at topright
legend("topright", lty=c(1,1,1),lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# plot reactive power figure
plot(dataSelected$datetime, dataSelected$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")


# Close the PNG file
dev.off()

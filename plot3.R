

##plot 3

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
png("plot3.png", height=480, width=480, bg="transparent", type="windows")

#Plot the graph
plot(dataSelected$datetime,dataSelected$Sub_metering_1, type="l", ylab="Energy sub Metering", xlab="", col = "black")

#Add red line graph
lines(dataSelected$datetime,dataSelected$Sub_metering_2, col="red")

#Add blue line graph
lines(dataSelected$datetime,dataSelected$Sub_metering_3, col="blue")

#Include legend at topright
legend("topright", lty=c(1,1,1),lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close the graphic device
dev.off()

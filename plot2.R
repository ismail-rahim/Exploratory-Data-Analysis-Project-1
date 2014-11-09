

##plot 2

#set the working directory
setwd("D:\\Git\\Exploratory Data Analysis")

# Read the text file using read.table function
data = read.table("household_power_consumption.txt", header = T, sep =";", na.strings="?", stringsAsFactors = FALSE)

#Extract data within date range
dataSelectedTime = subset (data, data$Date %in% c("1/2/2007","2/2/2007"))

# concat data and time to form new variable
dataSelectedTime$datetime <- paste(dataSelectedTime$Date, dataSelectedTime$Time)

# convert to date/time class
dataSelectedTime$datetime <- strptime(dataSelectedTime$datetime, "%d/%m/%Y %H:%M:%S" )

#Initialize graphics device of png file format
png("plot2.png", height=480, width=480, bg="transparent", type="windows")

#Plot the graph
plot(dataSelectedTime$datetime, dataSelectedTime$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Close the graphic device
dev.off()


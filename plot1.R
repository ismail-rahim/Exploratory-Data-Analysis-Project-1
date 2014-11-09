##plot 1

#set the working directory
setwd("D:\\Git\\Exploratory Data Analysis")

# Read the text file using csv2 function
data <- read.csv2("household_power_consumption.txt")

#Transform the "Date" column to date class
dataSelected <- transform(data,Date = as.Date(data$Date, "%d/%m/%Y"))

#Extract data within date range
dataSelected <- dataSelected[dataSelected$Date >= "2007-02-01" & dataSelected$Date <= "2007-02-02",]

#Initialize graphics device of png file format
png("plot1.png", width = 480, height = 480, bg="transparent", type="windows", units="px")

#Plot the histogram
hist(as.numeric(as.character(dataSelected[,3])), col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close the graphic device
dev.off()


fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/epc.zip")
unzip("./data/epc.zip", exdir="./data")
setwd("./data")
list.files()
initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259, stringsAsFactors=FALSE)
classes <- sapply(initial, class)
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=classes, nrows=2075259, stringsAsFactors=FALSE)
head(data)
sdata <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
head(sdata)
with(sdata, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power"))
dev.copy(png, file="plot1.png")
dev.off()
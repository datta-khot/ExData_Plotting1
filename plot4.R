allData <- read.table("../exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
filterData <- allData[as.Date(allData$Date, format="%d/%m/%Y") %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

par(mfrow=c(2,2))

xaxisData <- as.POSIXlt(paste(as.Date(filterData$Date, format="%d/%m/%Y"), filterData$Time))

#first graph
yaxisData <- as.numeric(as.character(filterData$Global_active_power))
plot(xaxisData, yaxisData, type="l", xlab="", ylab="Global Active Power")

#second graph
yaxisData <- as.numeric(as.character(filterData$Voltage))
plot(xaxisData, yaxisData, type="l", xlab="datetime", ylab="Voltage")

#third graph
yaxisData1 <- as.numeric(as.character(filterData$Sub_metering_1))
yaxisData2 <- as.numeric(as.character(filterData$Sub_metering_2))
yaxisData3 <- as.numeric(as.character(filterData$Sub_metering_3))
with(filterData, plot(xaxisData, yaxisData1, xlab="", ylab="Energy sub metering", type="n"))
lines(xaxisData, yaxisData1, col="black")
lines(xaxisData, yaxisData2, col="red")
lines(xaxisData, yaxisData3, col="blue")
legend("topright", pch="_____", col=c("black", "red", "blue"), bty ="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#fourth graph
yaxisData <- as.numeric(as.character(filterData$Global_reactive_power))
plot(xaxisData, yaxisData, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
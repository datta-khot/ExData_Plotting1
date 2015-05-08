allData <- read.table("../exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
filterData <- allData[as.Date(allData$Date, format="%d/%m/%Y") %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

xaxisData <- as.POSIXlt(paste(as.Date(filterData$Date, format="%d/%m/%Y"), filterData$Time))
yaxisData <- as.numeric(as.character(filterData$Global_active_power))
plot(xaxisData, yaxisData, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
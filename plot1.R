allData <- read.table("../exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
filterData <- allData[as.Date(allData$Date, format="%d/%m/%Y") %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]
hist(as.numeric(as.character(filterData$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
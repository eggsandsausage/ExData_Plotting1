library("data.table")

#loads the data and sets types
loadData <- function() {
    hhPowerConsumption <- fread("./data/household_power_consumption.txt", 
    	colClasses = "character", 
    	na.strings = "?")

    hhPowerConsumption <- 
        hhPowerConsumption[hhPowerConsumption$Date == "1/2/2007" | 
                           hhPowerConsumption$Date == "2/2/2007",]
    
    #set column types 
    numericColumns = names(hhPowerConsumption)[3:9]

    for (colName in numericColumns) {
    	set(hhPowerConsumption, 
    		j = colName, 
    		value = as.numeric(hhPowerConsumption[[colName]]))
    }

    set(hhPowerConsumption, 
    	j="Date", 
    	value=as.Date(hhPowerConsumption[, Date], 
    	format="%d/%m/%Y"))

   	set(hhPowerConsumption, 
   		j="dateTime", 
   		value=as.POSIXct(strptime(paste(hhPowerConsumption[,Date], hhPowerConsumption[,Time]), 
   		format ="%Y-%m-%d %H:%M:%S")))

   	hhPowerConsumption
}


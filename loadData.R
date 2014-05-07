library("data.table")

loadData <- function() {
    hhPowerConsumption <- fread("./data/household_power_consumption.txt")
    hhPowerConsumption <- 
        hhPowerConsumption[hhPowerConsumption$Date == "2/1/2007" | 
                           hhPowerConsumption$Date == "2/2/2007",]
    
    #force numeric values 
    numericColumns = names(hhPowerConsumption)[3:9]
    for (colName in numericColumns) {
    	set(hhPowerConsumption, j = colName, value = as.numeric(hhPowerConsumption[[colName]]))
    }
   	

   	hhPowerConsumption

    
}


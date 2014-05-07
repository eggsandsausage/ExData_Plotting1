source("loadData.R") 

#draws and puts graph 1 in a file
produceGraph1 <- function() {

	#loads the data and sets types, code available in repo (loadData.R)
	hhPowerConsumption <- loadData()

	png(file = "./plot1.png", width = 480, height = 480, units = "px")

	#draw graph
	hist(hhPowerConsumption$Global_active_power, 
		 main = "Global Active Power",
		 xlab = "Global Active Power (kilowatts)", 
		 ylab = "Frequency", 
		 col = "red")

	dev.off()
	return("Graph completed.")
}
source("loadData.R")

#draws and puts graph 3 in a file
produceGraph3 <- function() {
	
	#loads the data and sets types, code available in repo (loadData.R)
	hhPowerConsumption <- loadData()
	png(file = "./plot3.png", width = 480, height = 480, units = "px")

	#draw graph
	plot(x = hhPowerConsumption[,dateTime], 
		 y = hhPowerConsumption[,Sub_metering_1], type = "n", xlab = "", ylab = "Energy Sub Metering")

	lines(x = hhPowerConsumption[,dateTime], 
		  y = hhPowerConsumption[,Sub_metering_1], 
		  col = "black")
	lines(x = hhPowerConsumption[,dateTime], 
		  y = hhPowerConsumption[,Sub_metering_2], 
		  col = "red")
	lines(x = hhPowerConsumption[,dateTime], 
		  y = hhPowerConsumption[,Sub_metering_3], 
		  col = "blue")
	
	legend(x = "topright", 
		   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
		   col=c("black", "red", "blue"), 
		   lty = 1)
	dev.off()

	return("Graph completed.")
}
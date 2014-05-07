source("loadData.R")
#draws and puts graph 4 in a file

#main function to draw graph
produceGraph4 <- function() {
	hhPowerConsumption <- loadData()

	png(file = "./plot4.png", width = 480, height = 480, units = "px")

	#draw graph
	par(mfrow = c(2,2))	
	produceGraph1Tweaked("Global_active_power")
	produceGraph1Tweaked("Voltage")
	produceGraph3Tweaked()
	produceGraph1Tweaked("Global_reactive_power")
	
	dev.off()

	return("Graph completed.")
}

#tweaked version of graph from first assignment
produceGraph1Tweaked <- function(measurement) {
	#draw graph
	plot(x = hhPowerConsumption[,dateTime], 
       y = hhPowerConsumption[[measurement]],
       type = "l", 
	   xlab = "datetime", 
	   ylab = measurement)
}

#tweaked version of graph from third assignment
produceGraph3Tweaked <- function() {

	#draw graph
	plot(x = hhPowerConsumption[,dateTime], 
		 y = hhPowerConsumption[,Sub_metering_1], 
		 type = "n", xlab = "", ylab = "Energy sub metering")

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
		   col = c("black", "red", "blue"),
		   bty = "n",
		   lty = 1,
		   lwd = 1, 
		   cex = 0.8)
}
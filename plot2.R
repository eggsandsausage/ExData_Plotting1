source("loadData.R")

#draws and puts graph 2 in a file
produceGraph2 <- function() {

  #loads the data and sets types, code available in repo (loadData.R)
	hhPowerConsumption <- loadData()

	png(file = "./plot2.png", width = 480, height = 480, units = "px")

	#draw graph
  plot(x = hhPowerConsumption[,dateTime], 
       y = hhPowerConsumption[,Global_active_power], 
       type = "l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")

	dev.off()

	return("Graph completed.")
}
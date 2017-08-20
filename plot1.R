## libraries
require(ggplot2)

## set my work dir
setwd("C:/Users/jackzhang/Coursera/Exploring Data/Project2/")


## get data
file = "summarySCC_PM25.rds"
NEI <- readRDS(file)


## aggregate total PM25 emission from all sources per year
plotdata <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

## create the plot
png('plot1.png', width=480, height=480)

## plot data
plot(plotdata$year, plotdata$Emissions, type = "l", 
     main = "Total PM2.5 Emission in the US 1999-2008",
     xlab = "Year", ylab = "Emissions")

## close device
dev.off()

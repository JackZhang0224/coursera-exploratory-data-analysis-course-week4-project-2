## libraries
require(ggplot2)

## set my work dir
setwd("C:/Users/jackZhang/Coursera/Exploring Data/Project2/")


## get data
file = "summarySCC_PM25.rds"
NEI <- readRDS(file)


## aggregate total PM25 emission from Baltimore per year
baltimore <- subset(NEI, fips == "24510")
plotdata <- aggregate(baltimore[c("Emissions")], list(year = baltimore$year), sum)

## create plot
png('plot2.png', width=480, height=480)

## plot data
plot(plotdata$year, plotdata$Emissions, type = "l", 
     main = "Total PM2.5 Emission in Baltimore 1999-2008",
     xlab = "Year", ylab = "Emissions")

## close device
dev.off()

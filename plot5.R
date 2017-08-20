## libraries
require(ggplot2)

## set work dir
setwd("C:/Users/jackZhang/Coursera/Exploring Data/Project2/")

## get data
fileNEI = "summarySCC_PM25.rds"
NEI <- readRDS(fileNEI)

# read source classification codes (SCC)
fileSCC = "Source_Classification_Code.rds"
SCC <- readRDS(fileSCC)

## aggregate total PM25 emission from Baltimore per year
# get baltimore NEI data
baltimore <- subset(NEI, fips == "24510")

# get motor vehicle SCC
vehicleSource <- SCC[grepl("Vehicle", SCC$EI.Sector),]

# select baltimore data based on vehicle sources
vehicleBaltimore <- subset(baltimore, baltimore$SCC %in% vehicleSource$SCC)

# make plotdata
plotdata <- aggregate(vehicleBaltimore[c("Emissions")], 
                      list(type=vehicleBaltimore$type, 
                           year = vehicleBaltimore$year), sum)

## create plot
png('plot5.png', width=480, height=480)

## plot data
p <- ggplot(plotdata, aes(x=year, y=Emissions, colour=type)) +
    # fade out the points so you will see the line
    geom_point(alpha=0.1) +
    # use loess as there are many datapoints
    geom_smooth(method="loess") +
    ggtitle("Total PM2.5 Emissions in Baltimore for Motor Vehicles 1999-2008")
print(p)

## close device
dev.off()

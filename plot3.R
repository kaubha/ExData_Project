library(ggplot2)
# Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset
subsetNEI <- NEI[NEI$fips == "24510",]

#Calculate values for plot
totalNEI <- aggregate(Emissions ~ year + type, subsetNEI, sum)

#Plot
g <- ggplot(totalNEI, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("years") + ylab("Total Emissions in Baltimore City by type") +  ggtitle("Total PM2.5 by various years in Baltimore City by type")
print(g)

#Save to png
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()
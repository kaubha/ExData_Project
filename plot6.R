library(ggplot2)
# Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

#Calculate values for plot
totalNEI <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
totalNEI$fips[totalNEI$fips=="24510"] <- "Baltimore, MD"
totalNEI$fips[totalNEI$fips=="06037"] <- "Los Angeles, CA"

#Plot
g <- ggplot(totalNEI, aes(factor(year), Emissions))
g <- g + facet_grid(.~fips)
g <- g + geom_bar(stat = "identity") + xlab("years") + ylab("Total Emissions") +  ggtitle("Total PM25 (MV ON-ROAD) in Baltimore vs LA 1999-2008")
print(g)

#Save to png
dev.copy(png, file = "plot6.png", width=480, height=480)
dev.off()
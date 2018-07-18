library(ggplot2)
# Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

#Calculate values for plot
totalNEI <- aggregate(Emissions ~ year, subsetNEI, sum)


#Plot
g <- ggplot(totalNEI, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") + xlab("years") + ylab("Total Emissions") +  ggtitle("Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland from 1999 to 2008")
print(g)

#Save to png
dev.copy(png, file = "plot5.png", width=480, height=480)
dev.off()
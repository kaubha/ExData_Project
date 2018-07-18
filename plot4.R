library(ggplot2)
# Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge two datasets
NEISCC <- merge(NEI, SCC, by="SCC")

# Subset the rows with "coal" in Short.Name
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

#Calculate values for plot
totalNEI <- aggregate(Emissions ~ year, subsetNEISCC, sum)

#Plot
g <- ggplot(totalNEI, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") + xlab("years") + ylab("Total Emissions from coal cobustion in US") +  ggtitle("Total Emissions from coal sources from 1999 to 2008")
print(g)

#Save to png
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
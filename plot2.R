# Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset
subsetNEI <- NEI[NEI$fips == "24510",]

#Calculate values for plot
totalNEI <- aggregate(Emissions ~ year, subsetNEI, sum)

#Plot
barplot(totalNEI$Emissions, totalNEI$year, names.arg = totalNEI$year, xlab = "Years", ylab = "Total Emissions in Baltimore City", main = "Total PM2.5 by various years in Baltimore City")

#Save to png
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
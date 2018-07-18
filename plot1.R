# Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculate values for plot
totalNEI <- aggregate(Emissions ~ year, NEI, sum)

#Plot
barplot(totalNEI$Emissions, totalNEI$year, names.arg = totalNEI$year, xlab = "Years", ylab = "Total Emissions", main = "Total PM2.5 by various years")

#Save to png
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

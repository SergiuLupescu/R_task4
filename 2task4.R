library(readr) # read csv files.
library(arules) # association rules package.
library(arulesViz) # visualization tool for arules.

sales <- read.transactions("ElectronidexTransactions2017.csv", 
                           format = "basket",
                           sep = ",")
inspect(sales)
length(sales)
size(sales)
LIST(sales)
itemLabels(sales)
itemFrequency(sales)
itemFrequencyPlot(sales, topN = 10)
itemFrequencyPlot(sales, support = 0.05)
summary(sales)
image(sales[1:5])
dev.off()

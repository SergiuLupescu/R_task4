library(readr) # read csv files.
library(arules) # association rules package.
library(arulesViz) # visualization tool for arules.

# load dataset.
sales <- read.transactions("ElectronidexTransactions2017.csv", 
                           format = "basket",
                           sep = ",",
                           rm.duplicates = T)
# explore dataset.
inspect(head(sales))
length(sales)
size(sales)
LIST(sales)
itemLabels(sales)
itemFrequency(sales[ ,1:3])
itemFrequencyPlot(sales, topN = 20)
itemFrequencyPlot(sales, support = 0.05)
summary(sales)
image(sales[1:100])

# dev.off() # reset plots.

# rules model.
rules <- apriori(sales, 
                 parameter = list(support = 0.006,
                                  confidence = 0.50,
                                  minlen = 2,
                                  maxlen = 20))
# explore rules model.
summary(rules)
inspect(sort(rules, by = "lift")[1:10])

# check and eliminate redundant rules.
is.redundant(rules)
rules_not_red <- rules[!is.redundant(rules)]
is.redundant(rules_not_red)

# plot the rules.
plot(rules[1:10], method="graph", control=list(type="items"))
plot(rules, measure=c("support", "lift"), shading="confidence", interactive = T)
plot(rules, shading="order", control=list(main = "Two-key plot"))

# sort and plot the rules.
rules_not_red_sorted <- sort(rules_not_red, by = "lift")
plot(rules_not_red_sorted[1:5], method="graph", control=list(type="items"))
inspect(rules_not_red_sorted[1:10])
plot(rules_not_red_sorted)

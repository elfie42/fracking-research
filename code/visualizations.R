library(ggplot2)
library(tidyr)
library(scales)
library(tidyverse)

setwd("~/GitHub/fracking-research")

yrsCts <- read.csv("code/yrsCts.csv")
statesCts <- read.csv("code/statesCts.csv")


# plot number of jobs by state
stPlot <- ggplot(data = statesCts, aes(x = reorder(state, count), y = count)) +
  geom_bar(stat = "identity", fill = "darkslategrey") + 
  coord_flip() + 
  scale_y_continuous(trans = "log10", labels = label_comma(), expand = c(0, 0)) +
  labs(title = "Fracking Well Disclosures Between 2001-2023", y = "number of wells", x = "state") +
  geom_text(aes(label = count), hjust = 1.05, vjust = 0.4, color = "white", fontface = "bold") + 
  theme_minimal()
stPlot

sts2 <- read.csv("code/statesCts2.csv")

statePlot1 <- ggplot(data = sts2, aes(x = reorder(state, count), y = count)) +
  geom_bar(stat = "identity", fill = "blue", color = "blue") + 
  coord_flip() + 
  labs(title = "Number of Fracking Wells Disclosed Between 2001-2023 by State", y = "number of wells", x = "state") +
  geom_text(aes(label = count), hjust = -0.25, vjust = 0.5) + 
  theme_classic()

statePlot2 <- ggplot(data = sts2, aes(x = reorder(state, count), y = count)) +
  geom_bar(stat = "identity", fill = "darkolivegreen3") + 
  coord_flip() + 
  labs(title = "Number of Fracking Jobs Disclosed Between 2001-2023 by State", y = "number of wells", x = "state") +
  geom_text(aes(label = count), hjust = -0.25, vjust = 0.5) + 
  theme_classic()

statePlot1
statePlot2

# plot mean, median, and max water volume by state
byStateWaterVolAggs <- read.csv("code/stateAggs.csv")
longAggs <- pivot_longer(byStateWaterVolAggs, maxWaterVol:medianWaterVol)
aggsPlot <- ggplot(data = longAggs, aes(fill = name, x = state, y = value)) + 
            geom_bar(position="dodge", stat="identity") +
            coord_flip() +
            scale_y_continuous(trans = "log10")

aggsPlot

# plot top 10 operators with most disclosed jobs
wellOps <- read.csv("code/wellOps.csv")
wellOpsPlot <- ggplot(data = wellOps, aes(x = reorder(op, numJobs), y = numJobs)) +
  geom_bar(stat = "identity", fill = "darkolivegreen") + 
  coord_flip(ylim = c(2900, 7500)) + 
  labs(title = "Top 10 Most Prolific Well Operators in the United States", y = "number of jobs", x = "") +
  geom_text(aes(label = numJobs), hjust = -0.25, vjust = 0.5) + 
  theme_classic()
wellOpsPlot

# create box-and-whisker charts for each of the numerical variables in regCSV
numColsDF   <- read.csv("code/numColsDF.csv")
jobYear     <- numColsDF %>% slice(1)
depth       <- numColsDF %>% slice(2)
waterVol    <- numColsDF %>% slice(3)
nonWaterVol <- numColsDF %>% slice(4)
percentHF   <- numColsDF %>% slice(5)
massIng     <- numColsDF %>% slice(6) 

jobYearPlot <- ggplot(jobYear, aes(x = X, ymin = min, lower = Q1, middle = median, upper = Q3, ymax = max)) +
  geom_boxplot(stat = "identity") +
  geom_text(aes(x = X, y = mean), label = "_______", color = "green") +
  labs(x = "", y = "year") +
  theme_minimal()
jobYearPlot
  
depthPlot <- ggplot(depth, aes(x = X, ymin = min, lower = Q1, middle = median, upper = Q3, ymax = max)) +
  geom_boxplot(stat = "identity") +
  geom_text(aes(x = X, y = mean), label = "_______", color = "green") +
  labs(x = "", y = "") +
  scale_y_continuous(trans = "log10") +
  theme_minimal()
depthPlot

waterVolPlot <- ggplot(waterVol, aes(x = X, ymin = min, lower = Q1, middle = median, upper = Q3, ymax = max)) +
  geom_boxplot(stat = "identity") +
  geom_text(aes(x = X, y = mean), label = "_______", color = "green") +
  labs(x = "", y = "gallons") +
  scale_y_continuous(trans = "log10") +
  theme_minimal()
waterVolPlot

nonWaterVolPlot <- ggplot(nonWaterVol, aes(x = X, ymin = min, lower = Q1, middle = median, upper = Q3, ymax = max)) +
  geom_boxplot(stat = "identity") +
  labs(x = "", y = "gallons") +
  geom_text(aes(x = X, y = mean), label = "______", color = "green") +
  theme_minimal()
nonWaterVolPlot

percentPlot <- ggplot(percentHF, aes(x = X, ymin = min, lower = Q1, middle = median, upper = Q3, ymax = max)) +
  geom_boxplot(stat = "identity") +
  labs(x = "", y = "") +
  geom_text(aes(x = X, y = mean), label = "______", color = "green") +
  scale_y_continuous(trans = "log10", labels = label_number()) +
  theme_minimal()
percentPlot

massPlot <- ggplot(massIng, aes(x = X, ymin = min, lower = Q1, middle = median, upper = Q3, ymax = max)) +
  geom_boxplot(stat = "identity") +
  geom_text(aes(x = X, y = mean), label = "_______", color = "green") +
  labs(x = "", y = "lbs") +
  scale_y_continuous(trans = "log10") +
  theme_minimal()
massPlot


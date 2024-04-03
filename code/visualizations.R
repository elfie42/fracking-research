library(ggplot2)
library(tidyr)
library(scales)

setwd("~/GitHub/fracking-research")

yrsCts <- read.csv("code/yrsCts.csv")
statesCts <- read.csv("code/statesCts.csv")

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


byStateWaterVolAggs <- read.csv("code/stateAggs.csv")
aggsPlot <- ggplot(data = longAggs, aes(fill = name, x = state, y = value)) + 
            geom_bar(position="dodge", stat="identity") +
            coord_flip() +
            scale_y_continuous(trans = "log10")

aggsPlot

longAggs <- pivot_longer(byStateWaterVolAggs, maxWaterVol:medianWaterVol)


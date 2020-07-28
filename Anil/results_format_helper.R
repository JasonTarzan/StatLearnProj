setwd("C:\\Users\\anilk\\Desktop\\StatLearnProj\\Anil")

library(reshape2)
library(tidyverse)
results <- read.csv("ResultsTabulation.csv", stringsAsFactors = FALSE)
results$Accuracy <- as.numeric(results$Accuracy)

results_reformatted <- results %>% 
  filter(.$Additional.Tweaks == "Scaling") %>% 
  select(1, 2, 6) %>% 
  setNames(c("Embedding", "Classifier", "Accuracy")) %>% 
  dcast(Embedding ~ Classifier)

rownames(results_reformatted) <- results_reformatted$Embedding
results_reformatted$Embedding <- NULL
results_reformatted <- round(results_reformatted, 3)

# View(results_reformatted)

write.csv(results_reformatted, file = "results_formatted.csv", row.names = TRUE)

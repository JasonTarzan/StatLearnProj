# Packages

if (!require("dplyr")) {install.packages("dplyr"); install.packages("dplyr")}

# Check files

dir("../../data")

# Read in files

tweets_ <- read.csv("../../data/climate_change_tweets_sample-2020-05-16-17-57.csv", 
                    stringsAsFactors = FALSE) # original dataset
Encoding(tweets_[["text"]]) <- "UTF-8"
tweets <- tweets_
tweets[["text"]] <- tolower(tweets[["text"]])

# Data Validation

# Count Denier / Believer

sum(tweets[["label"]])
sum(!as.logical(tweets[["label"]]))

# Check all tweets contain keyword strings
# -> Not the case

nrow(tweets[!grepl("climate|global.?warming", tweets[["text"]]), ])
View(tweets[!grepl("climate|global.?warming", tweets[["text"]]), ])

# Check labels correspond to usernames

tweets %>% 
  select(username, user_handle, label) %>% 
  distinct %>% 
  View

# 
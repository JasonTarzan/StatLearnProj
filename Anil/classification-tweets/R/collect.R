# Setup - Packages and Authentication -------------------------------------

# if (!require("twitteR")) {install.packages("twitteR"); library("twitteR")}
# if (!require("curl")) {install.packages("curl")} # requried for rtweet and 
                                                 # problems installing as dependency
if (!require("rtweet")) {install.packages("rtweet"); library("rtweet")}
if (!require("tidyverse")) {install.packages("tidyverse"); library("tidyverse")}

# Bring in API Keys 
# NB Not required for rtweet

# source("R/api_keys.R")

# Collect tweets ----------------------------------------------------------
# NB Collections of tweets are named according to the query hashtag used

# TODO We may want to try words or phrases instead of collecting on the
#      basis of hashtags alone

collection_hashtags <- c(
  # Putatively Positive Attitudes
  "#climateaction",
  # Putatively Negative Attitudes
  "#climatehoax", ) # others...?

climateaction <- search_tweets("#climateaction", 
                               n = 10000, 
                               include_rts = FALSE) # exclude retweets

climatehoax <- search_tweets("#climatehoax", 
                             n = 10000, 
                             include_rts = FALSE) # exclude retweets

govegan <- search_tweets("#govegan", 
                             n = 10000, 
                             include_rts = FALSE) # exclude retweets

globalwarming <- search_tweets("#globalwarming", 
                               n = 10000, 
                               include_rts = FALSE) # exclude retweets

# preview #climateaction tweets data

View(climateaction)

# Breakdowns of hashtag counts
# NB We discount the case of the hashtag text

hashtags <- tolower(unlist(climateaction[["hashtags"]]))
hashtags_table <- setNames(data.frame(sort(table(hashtags))), 
                           c("hashtag", "freq"))

# Plot Hashtag Breakdowns

ggplot(hashtags_table[hashtags_table["freq"] > 100, ]) +
  geom_col(aes(x = hashtag, y = freq)) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(x = "Hashtag", y = "Frequency")

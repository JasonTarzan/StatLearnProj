# Setup -------------------------------------------------------------------

if (!require("tokenizers")) {install.packages("tokenizers"); library(tokenizers)}
if (!require("SnowballC")) {install.packages("SnowballC"); library(SnowballC)}
if (!require("stopwords")) {install.packages("stopwords"); library(stopwords)}
if (!require("devtools")) {install.packages("devtools"); library(devtools)}
if (!require("rword2vec")) {install_github("mukul13/rword2vec"); library(rword2vec)}

# Import Data -------------------------------------------------------------

tweets <- read.csv("../../data/climate_change_tweets_sample-2020-05-16-17-57.csv", 
                   encoding = "UTF-8", stringsAsFactors = FALSE)

# Cleaning ----------------------------------------------------------------

tokenize_tweets(tweets[["text"]], stopwords = stopwords())

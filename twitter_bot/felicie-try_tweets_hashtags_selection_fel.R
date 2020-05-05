#install.packages("twitteR")
#install.packages("ROAuth")
#install.packages("wordcloud")
#install.packages("RColorBrewer")
#install.packages("tm")

library(twitteR)
library(ROAuth)
library(wordcloud)
library(RColorBrewer)
library(tm)

#connection keys 
consumer_key <- "XXX"
consumer_secret <- "XXX"

access_token <- "XXX"
access_secret <- "XXX"

#Create a connection with twitter
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# obtain tweets
tweets <- searchTwitter("#climatechange",n=100,lang="en")
# So, here we can see that tweets are representating as a list

# Display the first of my list
print(tweets[[1]])
print(tweets[[1]]$text) # the text
print(tweets[[1]]$screenName) # The author
tweets[[1]]$id 
tweets[[1]]$created # Creation date
tweets[[1]]$isRetweet # Is it RT tweet or not?
tweets[[1]]$retweeted # Is the tweet has been RT or not?
tweets[[1]]$retweetCount # If the tweet has been RT, how many RT? 
tweets[[1]]$favorited # Is the tweet put in favorite by others users or not?

# copy the list in a data frame
df <- twListToDF(tweets)
print(dim(df)) # 100 tweets and 16 caracteristics
print(colnames(df))

##### Some descriptives statistics

#how many tweets by authors?
nb_tweets_authors <- table(df$screenName)
nb_tweets_authors = sort(nb_tweets_authors,decreasing=TRUE)

print(nb_tweets_authors[1:10]) # Just to show the first 10 more active authors
print(length(unique(df$screenName))) # Just to count how many unique authors there is

barplot(nb_tweets_authors [nb_tweets_authors >= 2], las = 2,cex.names=0.7,col="red") # Just to display authors who has tweet two or more than 2 tweets

# Here I want to show the nb of RT of the most popular tweets 
# I take the id of the tweets which are RT
idRT <- which(df$isRetweet)
nb_RT <- df$retweetCount[idRT]
index <- order(nb_RT,decreasing=TRUE)
# First 2 tweets whith different author and identifiant
print(df[df$isRetweet,][index[1:2],c('screenName','id','retweetCount')])
barplot(df$retweetCount[1:15], names.arg= df$id[1:15],las = 2,cex.names=0.7) 

#### Analyse of the theme of the tweets
data_without_duplicated <- df[!duplicated(df$text),]

data <- data_without_duplicated$text # I take only the text of the tweets

data_clean <- gsub("\n"," ",data) #delete \n
data_clean <- gsub('http\\S+\\s*',"",data_clean) # delete URL
data_clean <- gsub("\\s+"," ",data_clean) # delete the space which are usele
data_clean <- gsub("[\\]","",data_clean) #delete "\"
data_clean <- tolower(data_clean) #lower letters
data_clean <- gsub("rt ","",data_clean) #delete the RT symbol

data_clean_df <- data.frame(data=data_clean) # Make a df of the tweets
# write.csv2(data_clean_df, file = "tweets_clean.csv", row.names = FALSE) # just to export it on a cvs file

all_mots <- unlist(strsplit(data_clean," "))
hashtag <- regexpr("^#[[:alnum:]_]*",all_mots)
hashtag_list <- regmatches(all_mots,hashtag)
print(length(hashtag_list))

nb_hashtags <- table(hashtag_list)
nb_hashtags <- sort(nb_hashtags,decreasing=TRUE)
print(nb_hashtags[1:10])

#nb_hashtagstry <- list(nb_hashtags)
#class(nb_hashtagstry) # list for the wordcloud
#wordcloud(nb_hashtagstry, min.freq = 2, max.words = 20, colors =brewer.pal(6, "Dark2"))

#EXAMPLE to unterstand how it's work
#text_corpus <- Corpus(VectorSource(nb_hashtags))
#text_corpus <- tm_map(text_corpus, content_transformer(tolower)) maj min pareils
#text_corpus <- tm_map(text_corpus, removePunctuation) #ponctuation
#toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
#text_corpus <- tm_map(text_corpus, toSpace, "/")
#text_corpus <- tm_map(text_corpus, toSpace, "@")
#text_corpus <- tm_map(text_corpus, function(x)removeWords(x,stopwords(kind = "en")))
#wordcloud(text_corpus)




# install.packages("rtweet")
# install.packages("reactable")
# install.packages("glue")
# install.packages("stringr")
# install.packages("httpuv")
# install.packages("dplyr")
# install.packages("purrr")
# install.packages("httpuv")
# install.packages("tidyverse")
# install.packages("xlsx")

library(rtweet)
library(dplyr)
library(reactable)
library(tidyverse)
library(readr)
library(xlsx)

## To connect to the API
#connection keys 
consumer_key <- "XXX"
consumer_secret <- "XXX"

access_token <- "XXX"
access_secret <- "XXX"

token <- create_token(
  app = "your_name_app",
  consumer_key = consumer_key,
  consumer_secret = consumer_secret, 
  access_token = access_token,
  access_secret = access_secret)

# obtain tweets
data <- search_tweets(q = "#ClimateChange", n = 5000, include_rts = FALSE) #take 4814 values

data <- data[!duplicated(data$text),] # Put as TRUE when the text has already been count one time as FALSE
# length(unique(data$text)) ok 4814 = 4814

# all miniscule letters
for (i in 1:dim(data)[1]){
  data$hashtags[[i]] = str_to_lower(data$hashtags[[i]])
}


hashtags = data$hashtags
hashtags_vector = unlist(hashtags) # To get all the # as a vector

length(hashtags_vector) # 20202# counted with 4814 tweets

hashtags_vector = str_to_lower(hashtags_vector) # minicusle letters
length(hashtags_vector) # Still  20202# so ok

nb_hashtags = table(hashtags_vector)
nb_hashtags = sort(nb_hashtags,decreasing=TRUE)
barplot(nb_hashtags[1:15], xlab = "The Hashtags", ylab = "Nb of occurrences") 
nb_hashtags[1:30]

## to choose our list of denier and believer
nb_hashtags_df = as.data.frame(nb_hashtags)

## Look at the hashtags containing hoax
str_detect(nb_hashtags_df$hashtags_vector, "hoax")
sum(str_detect(nb_hashtags_df$hashtags_vector, "hoax") == TRUE ) # ok it's true

# We have with the hoax term in the hashtags relative the climate
# #globalwarminghoax 1 tweets
# #climatechangehoax 9 tweets
# #climatehoax 36 tweets
# only hoax term 8 tweets

## Look at the hashtags containing deniers
str_detect(nb_hashtags_df$hashtags_vector, "denier")
sum(str_detect(nb_hashtags_df$hashtags_vector, "denier") == TRUE ) #3
# #deniers 1 tweet
# #climatedeniers 1 tweets

## Look at the hashtags containing conservative
str_detect(nb_hashtags_df$hashtags_vector, "conservative")
sum(str_detect(nb_hashtags_df$hashtags_vector, "conservative") == TRUE ) #2
# #conservatives 3 tweets

## Look at the hashtags containing libtard
str_detect(nb_hashtags_df$hashtags_vector, "libtard")
sum(str_detect(nb_hashtags_df$hashtags_vector, "libtard") == TRUE )
# #libtards 1 tweet
# #libtardsunite 1 tweet

## Look at the hashtags containing fake
str_detect(nb_hashtags_df$hashtags_vector, "fake")
sum(str_detect(nb_hashtags_df$hashtags_vector, "fake") == TRUE )



# # for believers
#	climateaction 387
# climatebrawl 115
# climatecrisis 373
# climateemergency 223
# globalwarming 282

# # for deniers
# #globalwarminghoax 1 tweets
# #climatechangehoax 9 tweets
# #climatehoax 36 tweets
# only hoax term 11 tweets
#deniers 1 tweet
# #climatedeniers 2 tweets
# #climatechangedeniers 1 tweet
# #conservatives 4 tweet
#libtards 1 tweet
# #libtardsunite 1 tweet

deniers = c("globalwarminghoax","climatechangehoax", "libtardsunite", "libtards", "conservatives", "conservative",
            "climatechangedeniers","climatedeniers","deniers", "climatehoax")

for (i in 1:dim(data)[1]){
  if (is.na(match("climatehoax", c(data$hashtags[[i]]))) == FALSE){
    data$Y[i] = 0}
  else if (is.na(match("globalwarminghoax", c(data$hashtags[[i]]))) == FALSE){
    data$Y[i] = 0}
  else if (is.na(match("climatechangehoax", c(data$hashtags[[i]]))) == FALSE){
    data$Y[i] = 0}
  else if (is.na(match("libtardsunite", c(data$hashtags[[i]]))) == FALSE){
    data$Y[i] = 0}
  else if (is.na(match("libtards", c(data$hashtags[[i]]))) == FALSE){
    data$Y[i] = 0}
  else if (is.na(match("conservatives", c(data$hashtags[[i]]))) == FALSE){
    data$Y[i] = 0}
  else if (is.na(match("conservative", c(data$hashtags[[i]]))) == FALSE){
    data$Y[i] = 0}
  else if (is.na(match("climatechangedeniers", c(data$hashtags[[i]]))) == FALSE){
    data$Y[i] = 0}
  else if (is.na(match("climatedeniers", c(data$hashtags[[i]]))) == FALSE){
    data$Y[i] = 0}
  else if (is.na(match("deniers", c(data$hashtags[[i]]))) == FALSE){
    data$Y[i] = 0}
  else{
    data$Y[i] = 1}
  
}

sum(data$Y) # 4763: 1 for believers and 4763-4745 = 18 0 so deniers

# for (i in 1:dim(data_without_duplicated)[1]){
#   if (length(grep("hoax", c(data_without_duplicated$hashtags[[i]])))==0){
#     data_without_duplicated$Y[i] = 0}
#   else{
#     data_without_duplicated$Y[i] = 1}
#   
# }

# data_finale = write.csv2(data_without_duplicated, file = "data-_finale.csv")
# write.csv2(data_clean_df, file = "tweets_clean.csv", row.names = FALSE) # just to export it on a cvs file

save_as_csv(data, "/Users/FelicieBizeul/Desktop/ETUDES/ENSAI/Erasmus/SL/project/Data/datafinal.csv",
            prepend_ids = FALSE, na = "", fileEncoding = "UTF-8")

#### TO PUT ONE HASHTAG PER VARIABLE
data_one_hashtag_one_variable = data

nmax=0
i=0
for (i in 1:dim(data_one_hashtag_one_variable)[1]){
  n=length(data_one_hashtag_one_variable$hashtags[[i]])
  if (n>nmax) {
    nmax=n
    imax=i
  }
}

one_hashtag_one_variable <- matrix(rep(NA,length = nmax*dim(data_one_hashtag_one_variable)[1]),ncol =nmax)

for (i in 1:dim(one_hashtag_one_variable)[1]){
  n=length(data_one_hashtag_one_variable$hashtags[[i]])
  for (k in 1:n){
    one_hashtag_one_variable[i,k] <- data_one_hashtag_one_variable$hashtags[[i]][k]
  }
}

data <- data.frame(data_one_hashtag_one_variable,one_hashtag_one_variable)

data_for_model <- data[,91:118] # So, our Y binary variable and all the columns about the hashtags

####### THEN MODELS TO CLASSIFY 
reg_log <- glm(Y~ X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16+X17+X18+X19+X20+X21+X22+X23+X24+X25, data = data_for_model, family = binomial(logit))
summary(reg_log)

#reg_log2 <- glm(Y~ X1+X2+X3+X4, data = data_for_model, family = binomial(logit))
#summary(reg_log2)

############## Random forest
install.packages("randomForest")
install.packages("plotly")
library(randomForest)
library(plotly)

# rf = randomForest(Y~.,data=data_for_model, ntree = 10, mtry = 2, na.action = na.roughfix)

############## SVM
############## trees
############## KNN centrer les données

############## Multinomial Naives Bayes?
############## Gradient boosting?
############## NN?








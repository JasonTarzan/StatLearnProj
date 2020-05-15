# Classification of Climate Change Attitudes from Twitter NLP Analysis

Set up as a subdirectory of the main GitHub repository to keep modular scripts for the Statistical Learning project. 

### Project Overview

An NLP classification task. We will predict whether tweets indicate supportive or negative attitudes towards climate change and action to combat it. 

The phases of the project will be:
- Tweet collection - We will need to collect ~100,000 tweets or as close to this as possible.
- Tweet labelling ("ground truth") - We will heuristically use hashtags as a crude, first-shot indicator of the ground truth of our sentiment: pro- or anti-action on climate change. For example, tweets which carry the hashtag "#climatehoax" will be treated as being against climate action and therefore be encoded as 0 in our 0/1 binary classification scheme. 
  - NB This mode of assuming we know the ground truth is obviously flawed and merits further investigation. It has been adopted in the absence of a better scheme to classify large volumes of tweets programmatically. 
- Data cleaning - There will inevitably be some intermediate stage of data cleaning or preparation before the data we collect is even amenable to _word embedding_ or other bona fide pre-processing
- Tweet text pre-processing - We will need to find representations of our tweets that are amendable to being fed into classification machines 
- Tweet classification - We will try several approaches in trying to classify tweets on the basis of their textual content into a pro- or anti-climate action group. We will attempt to use e.g. [SVMs](https://en.wikipedia.org/wiki/Support-vector_machine), [random forests](https://en.wikipedia.org/wiki/Random_forest), logistic regression (with engineered features). 

#### Tweet collection

In order to collect tweets, we have looked into both the 
# StatLearnProj

## Proposal

NLP classification task regarding sentimental wrt veganism, environmental protection and/or other.

## Work Plan

1. Identify data sources from Twitter
   - Accounts from which to pull Tweets
   - Keywords or phrases to pull _all_ tweets within selected time windows (possibly retrospective)
     - Just before and after natural disaster occurs (?)
2. Write Twitter pipeline - possibly in a combination of R, Python and/or others (e.g. SQL)
    - Use Twitter API
    - Use NLTK; Stanford's library (not sure if ported from Java); RVest in R
3. Provide labels for data
   - Provide positive or negative labels for accounts which are assumed to have partisan opinions
     - Do we want a strategy for dealing with error? ...or should we just ignore it?
   - Manually label tweets which are pulled according to key phrases
4. Data Cleaning and Preprocessing
   - Clean initial data
   - Build representations amenable to being fed into model
5. Build statistical model
   - Classification approaches - Logistic Regression (GLM); Regression Trees; Ensemble Approaches; maybe Neural Networks?
   - Build separate models using classified accounts versus classified tweets
   - Multi-level models? Clustering tweets within people?

### Resources

- [Classifying Climate Change Tweets (Utilizing NLP and classification techniques to categorize tweets as climate change believer or denier tweets)](https://towardsdatascience.com/classifying-climate-change-tweets-8245450a5e96) - Medium post by [Andrew Graves](https://towardsdatascience.com/@gravesa333) found by Felicie
   - [Github repository](https://github.com/gravesa333/Classifying_Climate_Change_Tweets) accompanying this project

### Working with Text

- [NLTK Chapter 6. Learning to Classify Text](http://www.nltk.org/book/ch06.html)
- [A Comprehensive Guide to Understand and Implement Text Classification in Python by Shivam Bansal](https://www.analyticsvidhya.com/blog/2018/04/a-comprehensive-guide-to-understand-and-implement-text-classification-in-python/) 
- [Machine Learning, NLP: Text Classification using scikit-learn, python and NLTK by Javed Shaikh](https://towardsdatascience.com/machine-learning-nlp-text-classification-using-scikit-learn-python-and-nltk-c52b92a7c73a)
- [Text Classification in Python: Learn to build a text classification model in Python by Miguel Fernández Zafra](https://towardsdatascience.com/text-classification-in-python-dd95d264c802)

#### Dataset

- [Accounts scraped](https://docs.google.com/spreadsheets/d/1ilJNgGtmqJOyKxPdyGG15D4QdVMbmXjxbKZ0YyfNRHM/edit?usp=sharing)


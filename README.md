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

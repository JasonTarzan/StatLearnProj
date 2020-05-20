# Welcome,

## What are these notebooks and what do they do ?

1. *Data_Exploration.ipynb* :
    - Allow us to __explore the data__, make tiny statistics description of our dataset.

2. *Simple_Classifiers_Simple_Bow.ipynb* :
    - __Train simple models of classification__ such as Naive Bayes, Decision Tree, Support Vector Machines and Multilayer Perceptron.
    - __Text Preprocessing__ : Creation of bag of words fitted on our dataset's tweets using keras tokenizer and keras "text" to "numerical vectors"
 
3. *Simple_Classifiers_CBOW.ipynb* :
    - __rain simple models of classification__ such as Naive Bayes, Decision Tree, Support Vector Machines and Multilayer                      Perceptron.
    - __Text Preprocessing__ :
        - __Tokenizer__ : We use nltk, very poor tokenizer, can be improved by removing https://.. links, symbols...
        - __Continuous Bag of Words__ : We use gensim that allow us to train our language model, we use our tweets data.

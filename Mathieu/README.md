Welcome,

What are these notebooks and what do they do ?




###########################################################################################################################
- *Data_Exploration.ipynb* :
        Allow us to explore the data, make tiny statistics description of our dataset.

###########################################################################################################################
- *Simple_Classifiers_Simple_Bow.ipynb* :
        - Train simple models of classification such as Naive Bayes, Decision Tree, Support Vector Machines and Multilayer Perceptron.
        - Text Preprocessing : Creation of bag of words fitted on our dataset's tweets using keras tokenizer and keras "text" to                                     "numerical vectors"
 
 ##########################################################################################################################
- *Simple_Classifiers_CBOW.ipynb* :
        - Train simple models of classification such as Naive Bayes, Decision Tree, Support Vector Machines and Multilayer                      Perceptron.
        - Text Preprocessing : 
                - Tokenizer : We use nltk, very poor tokenizer, can be improved by removing https://.. links, symbols...
                - Continuous Bag of Words : We use gensim that allow us to train our language model, we use our tweets data.

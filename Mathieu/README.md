Welcome,

What are these notebooks and what do they do ?




###########################################################################################################################
- *Data_Exploration.ipynb* :
        Allow us to __explore the data__, make tiny statistics description of our dataset.

###########################################################################################################################
- *Simple_Classifiers_Simple_Bow.ipynb* :
        - __Train simple models of classification__ such as Naive Bayes, Decision Tree, Support Vector Machines and Multilayer Perceptron.
        - __Text Preprocessing__ : Creation of bag of words fitted on our dataset's tweets using keras tokenizer and keras "text" to "numerical vectors"
 
 ##########################################################################################################################
- *Simple_Classifiers_CBOW.ipynb* :
        - __Train simple models of classification__ such as Naive Bayes, Decision Tree, Support Vector Machines and Multilayer                      Perceptron.
        - __Text Preprocessing__ : 
                - Tokenizer : We use nltk, very poor tokenizer, can be improved by removing https://.. links, symbols...
                - Continuous Bag of Words : We use gensim that allow us to train our language model, we use our tweets data.

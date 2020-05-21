# Welcome,

## What are these notebooks and what do they do ?

1. *Data_Exploration.ipynb* :
    - Allow us to __explore the data__, make tiny statistics description of our dataset.

2. *Simple_Classifiers_Simple_Bow.ipynb* :
    - __Train simple models of classification__ such as Naive Bayes, Decision Tree, Support Vector Machines and Multilayer Perceptron.
    - __Text Preprocessing__ : Creation of bag of words fitted on our dataset's tweets using keras tokenizer and keras "text" to "numerical vectors"
 
3. *Simple_Classifiers_CBOW.ipynb* :
    - __Train simple models of classification__ such as Decision Tree, Support Vector Machines and Multilayer Perceptron.
    - __Text Preprocessing__ :
        - __Tokenizer__ : We use nltk, very poor tokenizer, can be improved by removing https://.. links, symbols...
        - __Continuous Bag of Words__ : We use gensim that allow us to train our language model, we use our tweets data.

4. *Simple_Classifiers_SkipGram.ipynb* :
    - __Train simple models of classification__ such as Decision Tree, Support Vector Machines and Multilayey Perceptron.
    - __Text Preprocessing__ :
        - __Tokenizer__ : We use nltk, very poor tokenizer, can be improved by removing https://.. links, symbols...
        - __Skip Gram__ : We use gensim that allow us to train our language model, we use our tweets data.

5. *Simple_Classifiers_GooglePretrained.ipynb* :
    - __Train simple models of classification__ such as Decision Tree, Support Vector Machines and Multilayey Perceptron.
    - __Text pretrained model__ : GoogleNews 300... I can't process larger model (in data size)

## Concerns
1. Is the word embeding good for personalized CBOW, personalized Skip Gram and pretrained model...
2. We might _(must!)_ tune the hyper parameters of the tokenization, embedding and classification algorithms... 3 different and interconnected tasks...
3. Implement log reg ? ...
4. Find why Simple BOW perform that good
5. Improve trained model by collect more tweets, maybe on other topics...
6. __Improve the tokenizer by removing noise...__ ==> didn't improved much the accuracy
7. __Pretrained Models__ ==> did GoogleNews300, next is Bert!

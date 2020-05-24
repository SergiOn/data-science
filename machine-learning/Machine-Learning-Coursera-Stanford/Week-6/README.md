## Week 6

### Evaluating a Learning Algorithm

#### Evaluating a Hypothesis

Evaluating a Hypothesis
Once we have done some trouble shooting for errors in our predictions by:

Getting more training examples
Trying smaller sets of features
Trying additional features
Trying polynomial features
Increasing or decreasing λ
We can move on to evaluate our new hypothesis.

A hypothesis may have a low error for the training examples but still be inaccurate (because of overfitting).
Thus, to evaluate a hypothesis, given a dataset of training examples,
we can split up the data into two sets: a training set and a test set.
Typically, the training set consists of 70 % of your data and the test set is the remaining 30 %.

#### Model Selection and Train/Validation/Test Sets

Just because a learning algorithm fits a training set well, that does not mean it is a good hypothesis.
It could over fit and as a result your predictions on the test set would be poor.
The error of your hypothesis as measured on the data set with which you trained the parameters will be lower than the error on any other data set.

Given many models with different polynomial degrees, we can use a systematic approach to identify the 'best' function.
In order to choose the model of your hypothesis, you can test each degree of polynomial and look at the error result.

One way to break down our dataset into the three sets is:
* Training set: 60%
* Cross validation set: 20%
* Test set: 20%

### Bias vs. Variance

#### Regularization and Bias/Variance

In the figure above, we see that as λ increases, our fit becomes more rigid.
On the other hand, as λ approaches 0, we tend to over overfit the data.
So how do we choose our parameter λ to get it 'just right' ?
In order to choose the model and the regularization term λ, we need to:

* Create a list of lambdas (i.e. λ∈{0,0.01,0.02,0.04,0.08,0.16,0.32,0.64,1.28,2.56,5.12,10.24});
* Create a set of models with different degrees or any other variants.
* Iterate through the λs and for each λ go through all the models to learn some Θ.
* Compute the cross validation error using the learned Θ (computed with λ) on the J_CV(Θ) without regularization or λ = 0.
* Select the best combo that produces the lowest error on the cross validation set.
* Using the best combo Θ and λ, apply it on J_test(Θ) to see if it has a good generalization of the problem.

#### Deciding What to Do Next Revisited

Our decision process can be broken down as follows:
* Getting more training examples: Fixes high variance
* Trying smaller sets of features: Fixes high variance
* Adding features: Fixes high bias
* Adding polynomial features: Fixes high bias
* Decreasing λ: Fixes high bias
* Increasing λ: Fixes high variance.

Diagnosing Neural Networks
* A neural network with fewer parameters is prone to underfitting.
It is also computationally cheaper.
* A large neural network with more parameters is prone to overfitting.
It is also computationally expensive. In this case you can use regularization (increase λ) to address the overfitting.

Using a single hidden layer is a good starting default.
You can train your neural network on a number of hidden layers using your cross validation set.
You can then select the one that performs best.

Model Complexity Effects:
* Lower-order polynomials (low model complexity) have high bias and low variance.
In this case, the model fits poorly consistently.
* Higher-order polynomials (high model complexity) fit the training data extremely well and the test data extremely poorly.
These have low bias on the training data, but very high variance.
* In reality, we would want to choose a model somewhere in between, that can generalize well but also fits the data reasonably well.



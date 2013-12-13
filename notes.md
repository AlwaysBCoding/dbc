# Introduction
Data Mining / Machine Learning ( What really is the difference? )

Any non-random data set inevitably has patterns. From these patterns we can make generalizations about the data. From these generalizations we can make predictions. Often times you can make very good generalizations and thus make very good predictions.

2 Classes of predictions
1. Numeric ( Regression )
2. Discrete ( Classification )

- Given a person's height what would you predict their weight is?
- Given a person's height what sport would you predict they play? ( Basketball, Gymnastics, Track )

- Given the beat of a song, what year can we predict the song was recorded in? ( This is numeric since there is meaning for 2010.5 )

Set of tools to help find patterns in data and make predictions, which can be applied in different ways. ( Statistical Modeling, Naive Bayes, K-nearest neighbors, K-means )

We can extract data from sources we never realized had data ( such as the audio rhythm of a song, and increasingly natural language and unstrutcutred text )

Since these predictions can be made with code, they can be handled by an application without human interpretation. For example a system can automatically recommend products etc...

What we are essentially doing is writing code that can extract meaning from data. Increasingly the definition for what can *be* data is increasing. Removing the bottleneck of manual interpretation of data. Which is often a bottleneck in many systems.

How is manual interpretation of data a bottleneck at DBC? ( In teaching web development )
One example I want to use, is debugging error messages.

"could not connect to server: No such file or directory Is the server running locally and accepting connections on Unix domain socket "/var/pgsql_socket/.s.PGSQL.5432"?"

- Error message displayed to the user
- User needs to determine what kind of error message it is
- User needs to remove application specific information in order to google it
- User needs to find relevant stack overflow solution or blog post

All of this is manual interpretation of data, but if we can do this through code we can build solutions that were previously impossible. *This* is really what I find so compelling.

# Heights and Weights
Given a person's height, what would we predict their weight is?
Simple problem of linear regression
Explore some data

- Very good at interpolation not always extrapolation

If we know a person is 5'10 what would we guess his weight is?
If we know a person is 5'10 and MALE what would we guess his weight is?

- Improvement by exploring data to find patterns, making generalizations, and making predictions from it
- I manually explored the data set to find patterns, but we can automate this!

# Classification
Given a height and a weight can we classify someone as a Male or a Female?

I am 5'10 and 195 lbs. can we classify?

The line is called a "separating hyperplane" or decision boundary. You can see that we would classify me as a Male which is the right decision to make.

This starts to break down when we have multiple classes to classify. We need a new approach, time to introduce the concept of nearest neighbor.

# Nearest Neighbor
Go to the slides to show the concept of nearest neighbor, and k-nearest neighbor to get an understanding of how this works. Do it with the female athelete data.

1 point doesn't work because an outlier can fuck with it.
A radius doesn't work because how large should the radius be?
Best way is to pick K number of points and take the average, or pick the highest class

# Measuring Distance
- d(x,y) >= 0 ( no negative distances )
- d(x,y) == 0 ( only if x = y )
- d(y,x) == d(x,y) ( distances are symmetric )
- d(x,y) <= d(x,z) + d(z,y) ( the triangle inequality )

Manhattan Distance
sum of { abs(x-y) for all dimensions }

Euclidian Distance
sum of { sqrt ( (x - y)^2 ) for all dimensions }

# What happens if we have more than one dimension? ( Now we're getting serious )
How do we model this in two-dimensonal space?

# Natural Language Processing

Building a term-document matrix. ( Also called document-term matrix )
Is a MATRIX where each ROW corresponds to a document, and each column corresponds to a TERM in the entire corpus of documents. Each cell is the frequency of that term in the document, with 0 meaning that the term did not appear.

I would assume that stemming could take place as a precursor to the creation of the TDM

Using KNN to find similar messages.
This can all be implemented in Ruby !!!
Attach to middleware and the entire process can be automated.

Turned an error message into data, wrote code that could model the data, interpret it and react to it without us doing anything. This allows us to build new solutions.

# NLP Workflow
1. Initialization
2. Clean Text
Use the tm package to perform some basic cleanup on the corpus
3. Build TDM
4. Attach Name
5. Stack matricies on top of one another?
6. Create hold out sample ( test set )
7. Model - knn
8. Assess accuracy

# INTRO SLIDES
# KNN SLIDES

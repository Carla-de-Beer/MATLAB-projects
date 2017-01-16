function p = predict(theta, X)
% Predicting a classification result based on logistical regression
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta

m = size(X, 1); % Number of training examples
p = sigmoid(X * theta) >= 0.5;

end

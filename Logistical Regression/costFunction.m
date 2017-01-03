% The computaion of the cost function as part of the 
% optimisation method to solve logistical regression
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

function [J, grad] = costFunction(theta, X, y)

	%COSTFUNCTION Compute cost and gradient for logistic regression

	m = length(y); % number of training examples

	J = (1 / m) * sum(-y'*log(sigmoid(X*theta)) - (1-y)'*log(1 - sigmoid(X*theta)));

	grad = (1 / m) * sum(X .* repmat((sigmoid(X*theta) - y), 1, size(X,2)));

end

% The computaion of the cost function as part of the 
% gradient descent method to solve multivariate linear regression
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

function J = computeCost(X, y, theta)

	m = length(y); % number of training examples
	J = (1/(2*m)) * sum(power((X*theta - y),2));

end

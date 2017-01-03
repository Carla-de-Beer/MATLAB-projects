% The sigmoid function for logistical regression
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

function g = sigmoid(z)

	%SIGMOID Compute sigmoid function

	g = 1 ./ (1 + exp(-z))

end

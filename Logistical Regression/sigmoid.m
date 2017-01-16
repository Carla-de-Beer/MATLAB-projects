function g = sigmoid(z)
% The sigmoid function for logistical regression
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

%SIGMOID Compute sigmoid function
g = 1 ./ (1 + exp(-z));

end

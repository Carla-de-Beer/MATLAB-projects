function [theta, J_history] = gradientDescent(X, y, theta, alpha, numIters)
% The gradient descent method to solve multivariate linear regression
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

m = length(y); 
J_history = zeros(numIters, 1);

for iter = 1:numIters
    delta = (1/m)*sum(X.*repmat((X*theta - y), 1, size(X,2)));
    theta = (theta' - (alpha * delta))';
    J_history(iter) = computeCost(X, y, theta);
end

end

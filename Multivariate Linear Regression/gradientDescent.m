function [theta, J_history] = gradientDescent(X, y, theta, alpha, numIters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, numIters) updates theta by
%   taking numIters gradient steps with learning rate alpha

m = length(y);
J_history = zeros(numIters, 1);

for iter = 1:numIters
    delta = (1/m)*sum(X.*repmat((X*theta - y), 1, size(X,2)));
    theta = (theta' - (alpha * delta))';
    J_history(iter) = computeCost(X, y, theta);
end

end

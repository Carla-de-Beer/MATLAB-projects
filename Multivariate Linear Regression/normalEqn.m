function [theta] = normalEqn(X, y)
% Function that computes the closed-form solution to linear 
% regression using the normal equations.
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

theta = zeros(size(X, 2), 1);
theta = pinv(X'*X)*X'*y;

end

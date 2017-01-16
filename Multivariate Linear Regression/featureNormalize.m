function [X_norm, mu, sigma] = featureNormalize(X)
% Function that returns a normalised version of X where
% the mean value of each feature is 0 and the standard deviation is 1. 
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

mu = mean(X);
sigma = std(X);

tf_mu = X - repmat(mu,length(X),1);
tf_std = repmat(sigma,length(X),1);

X_norm = tf_mu ./ tf_std;

end

% Function that returns a normalised version of X where
% the mean value of each feature is 0 and the standard deviation is 1. 
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

function [X_norm, mu, sigma] = featureNormalize(X)

	X_norm = X;
	mu = zeros(1, size(X, 2));
	sigma = zeros(1, size(X, 2));     

	mu = mean(X_norm);
	sigma = std(X_norm);

	tf_mu = X_norm - repmat(mu,length(X_norm),1);
	tf_std = repmat(sigma,length(X_norm),1);

	X_norm = tf_mu ./ tf_std;

end

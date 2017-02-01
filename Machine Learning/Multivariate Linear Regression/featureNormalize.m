function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

mu = mean(X);
sigma = std(X);

tf_mu = X - repmat(mu,length(X),1);
tf_std = repmat(sigma,length(X),1);

X_norm = tf_mu ./ tf_std;

end

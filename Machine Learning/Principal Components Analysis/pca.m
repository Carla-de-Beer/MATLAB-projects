function [U, S] = pca(X, k)
%PCA Run principal component analysis on the dataset X.
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% Computing the covariance matrix. Then, using the "svd" function
% to compute the eigenvectors and eigenvalues of the covariance matrix.

Sigma = (X' * X) / m;

[U, S, V] = svd(Sigma);

end

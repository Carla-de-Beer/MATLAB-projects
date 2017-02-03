function [x, lambda] = powerMethod(A, x0, TOL, N)
%The power method is an iterative technique used to approximate
%the dominant eigenvalue of a matrix, that is,
%the eigenvalue with the largest maginutde.
%
%   [x, lambda] = powerMethod(A, x0, TOL, N) returns the eigenvector for
%   the associated eigenvalue. We assume that A is an nxn matrix with
%   n eigenvalues with an ssociated collection of linearly independent
%   eigenvectors. Moreover, we assume that A has percisely one eigenvalue
%   that is largest in value. However, an nxn matrix A need not have n
%   linearly independent eigenvectors. When it does not, the Power method
%   may still be successful, but it is not guaranteed to be.
%
%   Algorithm taken from:
%   Burden, Faires, Burden. 2014. "Numerical Analysis". 10th Edition, Cengage
%   Learning, p587-588.
%   Created: September 2015

[i,j] = max(abs(x0)); % gives the value and index of the max + abs element
x = x0/x0(j);
lambda = [];

for k = 1:N
    
    y = A*x;
    mu = y(j); % calculating the scale factor
    [i,j] = max(abs(y));
    
    if mu == 0
        fprintf('A has eigenvalue 0, select new vector x and restart.');
        return;
    end
    
    lambda = [lambda; mu];
    
    ERR = norm(x - y/y(j));
    x = y/y(j);
    
    message = sprintf('Iteration %d',k);
    fprintf(message);
    
    if ERR < TOL
        mu = y(j);
        fprintf('Answer successfully calculated at:');
        message = sprintf('Iteration %d',k);
        fprintf(message);
        fprintf('*********************************');
        return;
    end
    
    x
    y
    mu;
    
end
fprintf('Max number of iterations exceeded.');
end

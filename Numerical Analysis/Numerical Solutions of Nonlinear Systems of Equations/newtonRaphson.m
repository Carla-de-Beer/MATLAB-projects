function [p, error] = newtonRaphson(f, df, p0, TOL, N)
%NEWTONRAPHSON is the Newton-Raphson method for finding successively better approximations
%to the roots (or zeroes) of a real-valued function.
%
%   p = newtonRaphson(f, df, p0, TOL, N) returns the approximate root.
%   f is the function for which the root is to be found,
%   df the first order differentiation of f, p is the initial guess,
%   TOL the tolerance and N the max number of iterations.
%
%   Created: November 2015

for i = 1:N
    
    p(i) = p0 - f(p0)/df(p0);
    
    message = sprintf('Iteration %d %s %0.10d', i, ': ' , p(i));
    fprintf(message);
    fprintf('\n');
    
    error = norm(p(i) - p0);
    
    if (error < TOL)
        fprintf('\n');
        fprintf('---------------------------------------\n');
        message = sprintf('Approximated solution: %0.10d', p(i));
        fprintf(message);
        message = sprintf('\nFound after iteration: %d ', i);
        fprintf(message);
        message = sprintf('\nError: %d', error);
        fprintf(message);
        fprintf('\n---------------------------------------\n');
        p = p0;
        return;
    end
    p0 = p(i);
    
end

fprintf('Number of iterations exceeded.');

end


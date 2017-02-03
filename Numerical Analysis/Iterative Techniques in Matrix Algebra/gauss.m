function x = gauss(A, b)
%GAUSS is the Gaussian elimination function with backward substitution.
%Achieves the same result as the built-in MATLAB function: A\b.
%   x = gauss(A,b) computes the value of x using
%   Gauss method A is an nxm matrix, and b an nx1 vector.
%   Returns the vector x.
%
%   Algorithm taken from:
%   Burden, Faires, Burden. 2014. "Numerical Analysis". 10th Edition, Cengage Learning, p368
%   Created: July 2015

n = size(A,1)   % getting n (number of rows)
A = [A b];      % produces the augmented matrix
count = 0;      % multiplication-division counter

% Elimination process
for i = 1:n-1   % for all the rows apart from the last one
    p = i;
    while p <= n & A(p,i) == 0
        p = p+1;    % increment p if first element is zero (i.e. identify next pivot)
    end
    if p == n+1     % no unique solution if all the row elements are zero
        fprintf('No unique solution (1).');
        return;
        if p ~= i;              %if p != i, then exchange rows i and p
            T = A(i,:);     % T is a temporary matrix used for swapping
            A(i,:) = A(p,:);
            A(p,:) = T;
        end
    end
    
    for j = i+1:n           % start from second row
        m = A(j,i)/A(i,i);  % get multiplier m
        count = count+1;
        for k = i+1:n+1     % addition of the jth row and a multiple of the kth row
            A(j,k) = A(j,k) - m*A(i,k); % subtract row values to get zeros
            count = count+1;
        end
    end
end

if A(n,n) == 0
    count
    fprintf('No unique solution (2).');
    return;
end

% Backward substitution
x(n,1) = A(n,n+1)/A(n,n); % divide last values
count = count+1;

for i = n-1:-1:1 % work back up the row stack
    sum = 0;
    for j = i+1:n
        sum = sum + A(i,j)*x(j);    % get the sum of the coefficients * variables
        count = count+1;
    end
    x(i) = (A(i,n+1) - sum)/A(i,i); % get first unknown by subtraction
    count = count+1;
end

count
fprintf('Procedure completed successfully.');

end


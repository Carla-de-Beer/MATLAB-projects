function getBestK(X)
%GETBESTK computes the most suitable k-value for the dataset X.

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

for c = 1:n-1
    
    Sigma = (X' * X) / m;
    
    [U, S, V] = svd(Sigma);
    
    % Check for 99% of retained variance using the S matrix:
    % Add up diagonal values up to k places
    total1 = 0;
    k = c;
    for i = 1:k
        for j = i:n
            if i == j
                total1 = total1 + S(i,j);
            end
        end
    end
    
    variance_retained = total1/trace(S);
    % fprintf('Variance retained: %f\n', variance_retained);
    
    if variance_retained >= 0.99
        bestK = c;
        fprintf('The best k-value is: %d\n', c);
        fprintf('Variance retained for the best k: %f', variance_retained);
        fprintf('%%. \n\n');
        return;
    end
    
end

end


function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

%SIGMOID Compute sigmoid function
g = 1 ./ (1 + exp(-z));

end

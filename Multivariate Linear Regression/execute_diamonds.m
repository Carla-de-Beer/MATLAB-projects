%% ================ Multivariate Linear Regression ===============

% Based on the Coursera Machine Learning course.
% Data set: Damonds
% https://vincentarelbundock.github.io/Rdatasets/datasets.html
% Created: January 2017

% Task: Given a dataset on diamond data (carat, colour, clarity, depth, price/ct) predict its price,
% using linear regression with feature
% normalisation. Cross-check the results using normal equations.

% The variables are:
% Carat: size of the diamond (in carats)
% Colour: coded as D (most white/bright) through J (D = 1; J = 7)
% Clarity: Coded as IF, VVS1, VVS2, VS1, VS2, VS2, SI2, or SI3
%   - IF = 1
%   - VVS1 = 2
%   - VVS2 = 3
%   - VS1 = 4
%   - VS2 = 5
%   - VS2 = 6
%   - SI2 = 7
%   - SI3 = 8
% Depth (as a percentage of diameter)
% Price/ct: price per carat
% TotalPrice: price for the diamond (in $)

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');
fprintf('\n');

%% Load Data
data = load('sourceFiles/diamonds.txt');
X = data(:, 1:5);
[m, n] = size(X);
y = data(:, n+1);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf('\n');
fprintf(['Diamonds rated on:\n ' ...
    '\t- carat, \n\t- colour, \n\t- clarity, \n\t- depth,' ...
    '\n\t- price/ct']);
fprintf('\n');

fprintf('\n');

fprintf(' x = [%.0f %.0f %.0f %.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('\n');
fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('\n');
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

fprintf('\n');
fprintf('Running gradient descent ...\n');
fprintf('\n');

numIters = 400;

% Init Theta1 and Run Gradient Descent
alpha1 = 0.01;
theta1 = zeros(n+1, 1);
[theta1, J1_history] = gradientDescent(X, y, theta1, alpha1, numIters);

% Init Theta2 and Run Gradient Descent
alpha2 = 0.3;
theta2 = zeros(n+1, 1);
[theta2, J2_history] = gradientDescent(X, y, theta2, alpha2, numIters);

% Init Theta3 and Run Gradient Descent
alpha3 = 0.03;
theta3 = zeros(n+1, 1);
[theta3, J3_history] = gradientDescent(X, y, theta3, alpha3, numIters);

% Plot the convergence graph
figure;
plot(1:numel(J1_history), J1_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

hold on;

plot(1:numel(J2_history), J2_history, '-r', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

hold on;

plot(1:numel(J3_history), J3_history, '-g', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Create legend data
a1 = num2str(alpha1);
a2 = num2str(alpha2);
a3 = num2str(alpha3);

l1 = strcat('\alpha 1 = ', a1);
l2 = strcat('\alpha 2 = ', a2);
l3 = strcat('\alpha 3 = ', a3);

legend(l1, l2, l3);

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf('\n');
fprintf(' %f \n', theta2);

%% ================ Part 3: Gradient Descent Results Predictions ================

% PREDICTION 1
% Estimate the total price (in $) of the following diamond:
% - carat: 0.45,
% - colour: E [2],
% - clarity: VVS1 [2],
% - depth: 62.3,
% - price/ct: 3342.1

x = [1; (0.45-mu(1))/sigma(1); (2-mu(2))/sigma(2); (2-mu(3))/sigma(3); (62.3-mu(4))/sigma(4); (3342.1-mu(5))/sigma(5)];
price1 = theta2' * x;

% PREDICTION 2
% Estimate the total price (in $) of the following diamond:
% - carat: 1.25,
% - colour: G [4],
% - clarity: VS2 [5],
% - depth: 74.7,
% - price/ct: 5478.3

x = [1; (1.25-mu(1))/sigma(1); (4-mu(2))/sigma(2); (5-mu(3))/sigma(3); (74.7-mu(4))/sigma(4); (5478.3-mu(5))/sigma(5)];
price2 = theta2' * x;

fprintf('\n----------------------------------------------------------------------------\n');
fprintf('----------------------------------------------------------------------------\n');
fprintf('PREDICTION 1\n');
fprintf('\n');
fprintf(['Predicted total price of a diamond with the following characteristics: ' ...
    '\n\t- carat: 0.45,' ...
    '\n\t- color: E [2],' ...
    '\n\t- clarity: VVS1 [2],' ...
    '\n\t- depth: 62.3,' ...
    '\n\t- price/ct: 3342.1 ' ...
    '(using gradient descent):\n $%f\n'], price1);
fprintf('\n');

fprintf('PREDICTION 2\n');
fprintf('\n');
fprintf(['Predicted total price of a diamond with the following characteristics: ' ...
    '\n\t- carat: 1.25,' ...
    '\n\t- color: G [4],' ...
    '\n\t- clarity: VS2 [5],' ...
    '\n\t- depth: 74.7,' ...
    '\n\t- price/ct: 5478.3 ' ...
    '(using gradient descent):\n $%f\n'], price2);

fprintf('\n----------------------------------------------------------------------------\n');
fprintf('----------------------------------------------------------------------------\n');

fprintf('Program paused. Press enter to continue.\n');
fprintf('\n');
pause;

%% ================ Part 4: Normal Equations & Predictons ================

fprintf('Solving with normal equations...\n');

%% Load Data
data = load('sourceFiles/diamonds.txt');
X = data(:, 1:5);
[m, n] = size(X);
y = data(:, n+1);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('\n');
fprintf('Theta computed from the normal equations: \n');
fprintf('\n');
fprintf(' %f \n', theta);

% PREDICTION 1
% Estimate the total price (in $) of the following diamond:
% - carat: 0.45,
% - colour: E [2],
% - clarity: VVS1 [2],
% - depth: 62.3,
% - price/ct: 3342.1

price1 = [1, 0.45, 2, 2, 62.3, 3342.1] * theta;

% PREDICTION 2
% Estimate the total price (in $) of the following diamond:
% - carat: 1.25,
% - colour: G [4],
% - clarity: VS2 [5],
% - depth: 74.7,
% - price/ct: 5478.3

price2 = [1, 1.25, 4, 5, 74.7, 5478.3] * theta;

fprintf('\n----------------------------------------------------------------------------\n');
fprintf('----------------------------------------------------------------------------\n');
fprintf('PREDICTION 1\n');
fprintf('\n');
fprintf(['Predicted total price of a diamond with the following characteristics: ' ...
    '\n\t- carat: 0.45,' ...
    '\n\t- color: E [2],' ...
    '\n\t- clarity: VVS1 [2],' ...
    '\n\t- depth: 62.3,' ...
    '\n\t- price/ct: 3342.1 ' ...
    '(using gradient descent):\n $%f\n'], price1);
fprintf('\n');

fprintf('PREDICTION 2\n');
fprintf('\n');
fprintf(['Predicted total price of a diamond with the following characteristics: ' ...
    '\n\t- carat: 1.25,' ...
    '\n\t- color: G [4],' ...
    '\n\t- clarity: VS2 [5],' ...
    '\n\t- depth: 74.7,' ...
    '\n\t- price/ct: 5478.3 ' ...
    '(using gradient descent):\n $%f\n'], price2);

fprintf('\n----------------------------------------------------------------------------\n');
fprintf('----------------------------------------------------------------------------\n');

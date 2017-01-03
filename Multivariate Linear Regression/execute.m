%% ================ Multivariate Linear Regression ===============

% Based on the Coursera Machine Learning course.
% Created: January 2017
% Data set: Discrimination in salaries
% http://data.princeton.edu/wws509/datasets/#salary

% Task: Given a dataset on personal data of university staff, predict the salary,
% in $, of a proposed employee, using linear regression with feature
% normalisation. Cross-check the results using normal equations.

% The variables are:
% sx = Sex, coded 1 for female and 0 for male
% rk = Rank, coded
%  - 1 for assistant professor,
%  - 2 for associate professor, and
%  - 3 for full professor
% yr = Number of years in current rank
% dg = Highest degree, coded 1 if doctorate, 0 if masters
% yd = Number of years since highest degree was earned
% sl = Academic year salary, in dollars.


%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('salaries.txt');
X = data(:, 1:5);
y = data(:, 6);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f %.0f %.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
numIters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(6, 1);
[theta, J_history] = gradientDescent(X, y, theta, alpha, numIters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

hold on;

alpha = 0.1;
numIters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(6, 1);
[theta, J_history] = gradientDescent(X, y, theta, alpha, numIters);

% Plot the convergence graph
plot(1:numel(J_history), J_history, '-r', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

hold on;

alpha = 0.05;
numIters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(6, 1);
[theta, J_history] = gradientDescent(X, y, theta, alpha, numIters);

% Plot the convergence graph
plot(1:numel(J_history), J_history, '-g', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

legend('\alpha = 0.01','\alpha = 0.1', '\alpha = 0.05')

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the salary of a:
% - female employee [1], 
% - assistant professor [1], 
% - 8 years in current rank [8], 
% - master's degree [0], 
% - 10 years since highest degree was earned [10]

x = [1; (1-mu(1))/sigma(1); (1-mu(2))/sigma(2); (8-mu(3))/sigma(3); (0-mu(4))/sigma(4); (10-mu(5))/sigma(5)];
price = theta' * x;

fprintf(['Predicted salary of a female employee, assistant professor, 8 years in current rank, masters degree, 10 years since highest degree was earned ' ...
         '(using gradient descent):\n $%f\n'], price);

%fprintf('Program paused. Press enter to continue.\n');
%pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

%% Load Data
data = csvread('salaries.txt');
X = data(:, 1:5);
y = data(:, 6);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the salary of a:
% - female employee [1], 
% - assistant professor [1], 
% - 5 years in current rank [8], 
% - master's degree [0], 
% - 3 years since highest degree was earned [10]

price = [1, 1, 1, 8, 0, 10] * theta;

fprintf(['Predicted salary of a female employee, assistant professor, 8 years in current rank, masters degree, 10 years since highest degree was earned ' ...
         '(using normal equations):\n $%f\n'], price);


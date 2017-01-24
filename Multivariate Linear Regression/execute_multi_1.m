%% ================ Multivariate Linear Regression ===============

% Based on the Coursera Machine Learning course.
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
clear; close all; clc

fprintf('Loading data ...\n');
fprintf('\n');

%% Load Data
data = load('sourceFiles/salaries.txt');
X = data(:, 1:5);
[m, n] = size(X);
y = data(:, n+1);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf('\n');
fprintf(['Academic salaries based on:\n ' ...
    '\t- gender, \n\t- rank, \n\t- year in current rank, \n\t- highest degree,' ...
    '\n\t- years since highest degree']);
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
alpha2 = 0.1;
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

%% ================ Part 3: Gradient Descent Predictions ================

% PREDICTION 1
% Estimate the salary of a:
% - female employee [1],
% - assistant professor [1],
% - 8 years in current rank [8],
% - master's degree [0],
% - 10 years since highest degree was earned [10]

x = [1; (1-mu(1))/sigma(1); (1-mu(2))/sigma(2); (8-mu(3))/sigma(3); (0-mu(4))/sigma(4); (10-mu(5))/sigma(5)];
salary1A = theta2' * x;

% Estimate the salary of a:
% - male employee [0],
% - assistant professor [1],
% - 8 years in current rank [8],
% - master's degree [0],
% - 10 years since highest degree was earned [10]

x = [1; (0-mu(1))/sigma(1); (1-mu(2))/sigma(2); (8-mu(3))/sigma(3); (0-mu(4))/sigma(4); (10-mu(5))/sigma(5)];
salary1B = theta2' * x;

% PREDICTION 2
% Estimate the salary of a:
% - female employee [1],
% - full professor [3],
% - 10 years in current rank [10],
% - doctorate degree [1],
% - 15 years since highest degree was earned [15]

x = [1; (1-mu(1))/sigma(1); (3-mu(2))/sigma(2); (10-mu(3))/sigma(3); (1-mu(4))/sigma(4); (15-mu(5))/sigma(5)];
salary2A = theta2' * x;

% Estimate the salary of a:
% - male employee [0],
% - full professor [3],
% - 10 years in current rank [10],
% - doctorate degree [1],
% - 15 years since highest degree was earned [15]

x = [1; (0-mu(1))/sigma(1); (3-mu(2))/sigma(2); (10-mu(3))/sigma(3); (1-mu(4))/sigma(4); (15-mu(5))/sigma(5)];
salary2B = theta2' * x;

fprintf('\n----------------------------------------------------------------------------\n');
fprintf('----------------------------------------------------------------------------\n');
fprintf('PREDICTION 1\n');
fprintf('\n');
fprintf(['Predicted salary of: ' ...
    '\n\t- a female employee,' ...
    '\n\t- assistant professor,' ...
    '\n\t- 8 years in current rank,' ...
    '\n\t- masters degree,' ...
    '\n\t- 10 years since highest degree was earned ' ...
    '(using gradient descent):\n $%f\n'], salary1A);

fprintf('\n');
fprintf(['Predicted salary of: ' ...
    '\n\t- a male employee,' ...
    '\n\t- assistant professor,' ...
    '\n\t- 8 years in current rank,' ...
    '\n\t- masters degree, '...
    '\n\t- 10 years since highest degree was earned ' ...
    '(using gradient descent):\n $%f\n'], salary1B);

fprintf('\n');
fprintf('PREDICTION 2\n');
fprintf('\n');
fprintf(['Predicted salary of: ' ...
    '\n\t- a female employee,' ...
    '\n\t- full professor,' ...
    '\n\t- 10 years in current rank,' ...
    '\n\t- doctorate degree,' ...
    '\n\t- 15 years since highest degree was earned ' ...
    '(using gradient descent):\n $%f\n'], salary2A);

fprintf('\n');
fprintf(['Predicted salary of: ' ...
    '\n\t- a male employee,' ...
    '\n\t- full professor,' ...
    '\n\t- 10 years in current rank,' ...
    '\n\t- doctorate degree, '...
    '\n\t- 15 years since highest degree was earned ' ...
    '(using gradient descent):\n $%f\n'], salary2B);
fprintf('\n----------------------------------------------------------------------------\n');
fprintf('----------------------------------------------------------------------------\n');

fprintf('Program paused. Press enter to continue.\n');
fprintf('\n');
pause;

%% ================ Part 4: Normal Equations ================

fprintf('Solving with normal equations...\n');

%% Load Data
data = csvread('sourceFiles/salaries.txt');
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
% Estimate the salary of a:
% - female employee [1],
% - assistant professor [1],
% - 8 years in current rank [8],
% - master's degree [0],
% - 10 years since highest degree was earned [10]

salary1A = [1, 1, 1, 8, 0, 10] * theta;

% Estimate the salary of a:
% - male employee [0],
% - assistant professor [1],
% - 8 years in current rank [8],
% - master's degree [0],
% - 10 years since highest degree was earned [10]

salary1B = [1, 0, 1, 8, 0, 10] * theta;

% PREDICTION 2
% Estimate the salary of a:
% - female employee [1],
% - full professor [3],
% - 10 years in current rank [10],
% - doctorate degree [1],
% - 15 years since highest degree was earned [15]

salary2A = [1, 1, 3, 10, 1, 15] * theta;

% Estimate the salary of a:
% - male employee [0],
% - full professor [3],
% - 10 years in current rank [10],
% - doctorate degree [1],
% - 15 years since highest degree was earned [15]

salary2B = [1, 0, 3, 10, 1, 15] * theta;

fprintf('\n----------------------------------------------------------------------------\n');
fprintf('----------------------------------------------------------------------------\n');
fprintf('PREDICTION 1\n');
fprintf('\n');
fprintf(['Predicted salary of: ' ...
    '\n\t- a female employee,' ...
    '\n\t- assistant professor,' ...
    '\n\t- 8 years in current rank,' ...
    '\n\t- masters degree,' ...
    '\n\t- 10 years since highest degree was earned ' ...
    '(using normal equations):\n $%f\n'], salary1A);

fprintf('\n');
fprintf(['Predicted salary of: ' ...
    '\n\t- a male employee,' ...
    '\n\t- assistant professor,' ...
    '\n\t- 8 years in current rank,' ...
    '\n\t- masters degree,' ...
    '\n\t- 10 years since highest degree was earned ' ...
    '(using normal equations):\n $%f\n'], salary1B);

fprintf('\n');
fprintf('PREDICTION 2\n');
fprintf('\n');
fprintf(['Predicted salary of: ' ...
    '\n\t- a female employee,' ...
    '\n\t- full professor,' ...
    '\n\t- 10 years in current rank,' ...
    '\n\t- doctorate degree,' ...
    '\n\t- 15 years since highest degree was earned ' ...
    '(using normal equations):\n $%f\n'], salary2A);

fprintf('\n');
fprintf(['Predicted salary of: ' ...
    '\n\t- a male employee,' ...
    '\n\t- full professor,' ...
    '\n\t- 10 years in current rank,' ...
    '\n\t- doctorate degree,' ...
    '\n\t- 15 years since highest degree was earned ' ...
    '(using normal equations):\n $%f\n'], salary2B);
fprintf('\n----------------------------------------------------------------------------\n');
fprintf('----------------------------------------------------------------------------\n');

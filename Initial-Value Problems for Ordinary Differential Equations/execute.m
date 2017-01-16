%% Initialization
clear; close all; clc

%% ========== Part 1: Euler Method ==========
clear;
fprintf('------------------------------\n');
fprintf('\nExecuting the Euler Method ...\n');
fprintf('\n------------------------------\n');

f = @(t,y) (y - t^2 + 1);
a = 0; 
b = 1; 
alpha = 0.5;
N = 10;

[t, w] = euler(f, a, b, alpha, N)

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ========== Part 2: Heun Method ==========
clear;
fprintf('\n------------------------------\n');
fprintf('\nExecuting the Euler Method ...\n');
fprintf('\n------------------------------\n');

f = @(t,y) (y - t^2 + 1)
a = 0; 
b = 1; 
alpha = 0.5;
N = 10;

[t, w] = heun(f, a, b, alpha, N)

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ========== Part 3: Runge-Kutta Method  (order 4) ==========

clear;
fprintf('\n----------------------------------------------\n');
fprintf('\nExecuting the Runge-Kutta Method (order 4) ...\n');
fprintf('\n----------------------------------------------\n');

f = @(t,y) (y - t^2 + 1)
a = 0; 
b = 1; 
alpha = 0.5;
N = 10;
[t, w, error] = rk45(f, a, b, alpha, N)

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ========== Part 4: Initial Value Problem Comparison  (order 4) ==========

clear;
fprintf('\n--------------------------------------------------\n');
fprintf('\nExecuting the Initial Value Problem Comparison ...\n');
fprintf('\n--------------------------------------------------\n');

[t, w, error] = initialValueProblemComparison()

fprintf('\n--------------\n');
fprintf('\nDONE\n');
fprintf('\n--------------\n');





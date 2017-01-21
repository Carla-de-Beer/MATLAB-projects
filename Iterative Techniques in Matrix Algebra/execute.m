%% Iterative Techniques in Matrix Algebra
%
% Created: January 2017

%% Initialization
clear; close all; clc

%% ========== Part 1: Gauss Method ==========

fprintf('------------------------------\n');
fprintf('\nExecuting the Gauss Method ...\n');
fprintf('\n------------------------------\n');

A = [3, -1, 1; 3, 6, 2; 3, 3, 7];
b = [1; 0; 4];

x = gauss(A,b)

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ========== Part 2: LU Factorisation ==========

fprintf('\n-----------------------------------------\n');
fprintf('\nExecuting the LU Factorisation Method ...\n');
fprintf('\n-----------------------------------------\n');

A = [3, -1, 1; 3, 6, 2; 3, 3, 7];

A

[L,U] = factorLU(A)

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ========== Part 3: Jacobi Method ==========

clear;
fprintf('\n-------------------------------\n');
fprintf('\nExecuting the Jacobi Method ...\n');
fprintf('\n-------------------------------\n');

A = [3, -1, 1; 3, 6, 2; 3, 3, 7];
b = [1; 0; 4];
x0 = [0; 0; 0];
TOL = 1e-6;
N = 20;

x = Jacobi(A, b, x0, TOL, N)

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ========== Part 4: Gauss-Seidel Method ==========

clear;
fprintf('\n-------------------------------\n');
fprintf('\nExecuting the Jacobi Method ...\n');
fprintf('\n-------------------------------\n');

A = [3, -1, 1; 3, 6, 2; 3, 3, 7];
b = [1; 0; 4];
x0 = [0; 0; 0];
TOL = 1e-6;
N = 20;

x = gaussSeidel(A, b, x0, TOL, N)

fprintf('\n--------------\n');
fprintf('\nDONE\n');
fprintf('\n--------------\n');

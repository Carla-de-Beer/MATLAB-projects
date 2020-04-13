%% Approximating Eigenvalues
%
% Created: February 2017

%% Initialization
clear; close all; clc

%% ========== Part 1: The Power Method ==========

fprintf('------------------------------\n');
fprintf('\nExecuting the Power Method ...\n');
fprintf('\n------------------------------\n\n');

A = [4 1 -1 0; 1 3 -1 0;-1 -1 5 2; 0 0 2 4];
x0 = [0;1;0;0];
TOL = 1*10^-6;
N = 50;

[x, lambda] = powerMethod(A, x0, TOL, N)
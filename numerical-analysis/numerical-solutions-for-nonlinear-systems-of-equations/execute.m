%% Numerical Solutions of Nonlinear Systems of Equations
%
% Created: February 2017

%% Initialization
clear; close all; clc

%% ========== Part 1: Newton-Raphson Method ==========

fprintf('---------------------------------------\n');
fprintf('\nExecuting the Newton-Raphson Method ...\n');
fprintf('\n---------------------------------------\n\n');

f =  @(x)[x^3-2*x^2-5];
df =  @(x)[3*x^2-4*x];
p0 = 2;
TOL = 1*10^-6;
N = 30;

[p, error] = newtonRaphson(f, df, p0, TOL, N)
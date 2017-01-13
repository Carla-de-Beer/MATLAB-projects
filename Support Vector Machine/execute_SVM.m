%% Machine Learning Online Class

% Based on the Coursera Machine Learning course.
% Created: January 2017

%% Initialization
clear; close all; clc

%% ========== Training SVM with RBF Kernel ==========


% Load X, y in the coding environment
load('data.mat');

% Try different SVM Parameters here and get the optimum
[C, sigma] = dataset3Params(X, y, Xval, yval);

% Train the SVM
model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
visualizeBoundary(X, y, model);

Xunknown1 = [-0.3531 -0.6739]; 
Xunknown2 = [-0.2271  0.4473];
Xunknown3 = [0.1499  -0.1048]; 
Xunknown4 = [-0.4995  0.0164];
yKnown = [0; 1; 0; 1];

calculatePredictions(model, Xunknown1, yKnown(1));
calculatePredictions(model, Xunknown2, yKnown(2));
calculatePredictions(model, Xunknown3, yKnown(3));
calculatePredictions(model, Xunknown4, yKnown(4));

fprintf('Program completed.\n');
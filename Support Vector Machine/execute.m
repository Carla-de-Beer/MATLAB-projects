%% Support Vector Machine: Machine Learning Online Class
%
% Based on the Coursera Machine Learning course.
%
% Created: January 2017

%% Initialization
clear; close all; clc

%% ========== Training SVM with RBF Kernel ==========

% Load X, y in the coding environment
load('data.mat');
misclassified = 0;

% Try different SVM Parameters here and get the optimum
[C, sigma] = datasetParams(X, y, Xval, yval);

% Train the SVM
model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
visualizeBoundary(X, y, model);

for i = 1:size(Xval, 1)
    misclassified = misclassified + calculatePredictions(model, Xval(i, :), yval(i));
end

accuracy = 1 - (misclassified / size(Xval, 1));

fprintf('\nAccuracy of the SVM on the predicted unknown values: %f\n', accuracy);
fprintf('\nProgram completed.\n');
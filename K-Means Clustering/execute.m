%% ================ K-Means Clustering ===============

% Based on the Coursera Machine Learning course.
%
% Using K-Means Clusterting to find cluster groups in a data set.
% The algorithm is run 5 times, with a maximum of 10 iteratiosn each.
% The centroid positions are randomly initialised each time.
%
% Created: January 2017

%% Initialization
clear; close all; clc

%% =================== Part 3: K-Means Clustering ======================

fprintf('\nRunning K-Means clustering on example dataset.\n\n');

% Load an example dataset
load('data.mat');

% Settings for running K-Means
K = 3;
max_iters = 10;
num_runs = 5;

% Run the K-Means Clustering algorithm for a number of times
% and determine the most suitable solution
for i = 1:num_runs

    % Generate the centroids automatically, such as by
    % settings them to be random examples.
    initial_centroids = kMeansInitCentroids(X, K);
    % initial_centroids = [3 3; 6 2; 8 5]; % Could use a fixed starting position
    % for the centroids

    % Run K-Means algorithm. The 'true' at the end tells our function to plot
    % the progress of K-Means
    [centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);
    fprintf('\nK-Means Done.\n\n');

end 

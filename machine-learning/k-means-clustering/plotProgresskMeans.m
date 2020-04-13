function plotProgresskMeans(X, centroids, previous, idx, K, i, isEnd)
%PLOTPROGRESSKMEANS is a helper function that displays the progress of
%k-Means as it is running. It is intended for use only with 2D data.
%   PLOTPROGRESSKMEANS(X, centroids, previous, idx, K, i) plots the data
%   points with colors assigned to each centroid. With the previous
%   centroids, it also plots a line between the previous locations and
%   current locations of the centroids.

% Plot the examples
plotDataPoints(X, idx, K);

if isEnd == true
    col = [0.941 0.141 0.447]; % pink
    
    % Plot the centroids as black x's
    plot(centroids(:,1), centroids(:,2),...
        'o', 'MarkerEdgeColor', col, ...
        'MarkerSize', 20, 'LineWidth', 2);
else
    plot(centroids(:,1), centroids(:,2),...
        'x', 'MarkerEdgeColor','k', ...
        'MarkerSize', 10, 'LineWidth', 1.5);
end

h = zeros(4, 1);
h(1) = plot(NaN, NaN, 'Color', [0.941 0.141 0.447],...
    'Marker', 'o','LineStyle', 'none',...
    'MarkerSize', 10, 'LineWidth', 1.5);

h(2) = plot(NaN, NaN, 'Color', 'c',...
    'Marker', 'o','LineStyle', 'none',...
    'MarkerSize', 6, 'LineWidth', 0.7);

h(3) = plot(NaN, NaN, 'Color', 'g',...
    'Marker', 'o','LineStyle', 'none',...
    'MarkerSize', 6, 'LineWidth', 0.7);

h(4) = plot(NaN, NaN, 'Color', 'r',...
    'Marker', 'o','LineStyle', 'none',...
    'MarkerSize', 6, 'LineWidth', 0.7);

legend(h, 'Computed cluster centroid', 'Cluster 1', 'Cluster 2', 'Cluster 3');

% Plot the history of the centroids with lines
for j = 1:size(centroids,1)
    drawLine(centroids(j, :), previous(j, :));
end

% Title
title(sprintf('Iteration number %d', i))

end


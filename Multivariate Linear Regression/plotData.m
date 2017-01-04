% PLOTDATA(x,y) plots the data points and gives the figure axes labels of
% population and profit.
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

function plotData(x, y)

	figure; % open a new figure window

	plot(x, y, 'rx', 'MarkerSize', 10); % Plot the data 
	ylabel('Profit in $10,000s'); % Set the y-axis label 
	xlabel('Population of City in 10,000s'); % Set the x-axis label

end

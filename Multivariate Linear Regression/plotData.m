function plotData(x, y)
% PLOTDATA(x,y) plots the data points and gives the figure axes labels of
% population and profit.
% Based on the Coursera 'Machine Learning' online course.
% Created: January 2017

figure; 
plot(x, y, 'rx', 'MarkerSize', 10); 
ylabel('Profit in $10,000s'); 
xlabel('Population of City in 10,000s'); 

end

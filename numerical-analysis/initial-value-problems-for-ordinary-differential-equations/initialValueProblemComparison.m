function [t, w, error] = initialValueProblemComparison()
%INITIALVALUECOMPARISON is a function that compares
%the Euler Method and the Runge-Kutta Order 4 Method.
%   [t, w, error] = initialValueProblemComparison() computes the
%   initial values. 
%   Returns the timestep, w-value and error.

% Variables with which to compare the two functions
f = @(t,y) (y - t^2 + 1);
a = 0;
b = 8;
alpha = 0.5;
N = 20;

title('Comparing the Euler, Heun and Runge-Kutta Order 4 Methods')
[t, w] = euler(f, a, b, alpha, N);
hold on;

[t, w] = heun(f, a, b, alpha, N)

hold on;
[t, w, error] = rk45(f, a, b, alpha, N)
legend('Euler','Heun', 'RK45')

end


function [t, w] = heun(f, a, b, alpha, N)
%HEUN is the Heun method to solve an initial value problem of order 3.
%   [t, w] = heun(f, a, b, alpha, N)  computes the fourth-order
%   initial values. f is the function.
%   Returns the timestep, w-value and error.
%
%   Algorithm taken from:
%   Burden, Faires, Burden. 2014. "Numerical Analysis". 10th Edition, Cengage
%   Learning, p287
%   Created: October 2015

h = (b - a)/N;
t(1) = a;
w(1) = alpha;

for k = 1:N
    
    k1 = h*f(t(k), w(k));
    k2 = h*f(t(k) + h/3, w(k) + k1/3);
    k3 = h*f(t(k) + 2/3*h, w(k) + 2/3*k2);
    
    w(k+1,:) = w(k) + (k1 + 3*k3)/4;
    t(k+1,:) = t(k) + h;
    
    exact = (t(k+1,:) + 1)^2 - 0.5 * exp(t(k+1,:));
    error = norm(exact - w(k+1,:));
    
end

fprintf('Heun Method completed.\n');
plot(t, w, '--b*');
xlabel('Time (t)');
ylabel('Function output per time step (w)');
title('Heun Method');

error

end


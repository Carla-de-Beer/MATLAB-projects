function [t, w] = euler(f, a, b, alpha, N)
%EULER is the Euler method to solve an initial value problem.
%   [t, w] = euler(f, a, b, alpha, N) computes the Euler function. f is the function.
%   Returns the timestep, w-value and error.
%   
%   Algorithm taken from:
%   Burden, Faires, Burden. 2014. "Numerical Analysis". 10th Edition, Cengage
%   Learning, p267
%   Created: October 2015

h = (b - a)/N;
t(1) = a;
w(1) = alpha;

for k = 1:N
    w(k+1,:) = w(k) + h*f(t(k), w(k));
    t(k+1,:) = a + k*h;
end

fprintf('Euler method completed.\n');
plot(t, w, ':r*');
xlabel('Time (t)')
ylabel('Function output per time step (w)')

end




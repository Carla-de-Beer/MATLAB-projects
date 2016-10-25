% The Euler method to solve an initial value problem
% Algorithm taken from:
% Burden, Faires, Burden. 2014. "Numerical Analysis". 10th Edition, Cengage
% Learning, p267
% Created: October 2015

% Example variables:    f = @(t,y) (y - t^2 + 1)
%                       a = 0; b = 1; alpha = 0.5
%                       N = 10

function [ t, w ] = euler( f, a, b, alpha, N )

    h = (b - a)/N;
    t(1) = a;
    w(1) = alpha;

    for k = 1:N
        w(k+1,:) = w(k) + h*f(t(k), w(k));
        t(k+1,:) = a + k*h;
    end    
    
    disp('Euler method completed.'); 
    plot(t, w, ':r*');
    xlabel('Time (t)')
    ylabel('Function output per time step (w)')
    
end




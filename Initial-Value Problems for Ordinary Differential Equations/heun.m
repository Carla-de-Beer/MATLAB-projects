% The Runge-Kutta method (order 4) to solve an initial value problem
% Algorithm taken from:
% Burden, Faires, Burden. 2014. "Numerical Analysis". 10th Edition, Cengage
% Learning, p287
% Created: October 2015

% Example variables:    f = @(t,y) (y - t^2 + 1)
%                       a = 0; b = 1; alpha = 0.5
%                       N = 10

function [ t, w ] = heun( f, a, b, alpha, N )

    h = (b - a)/N;
    t(1) = a;
    w(1) = alpha;

    for k = 1:N
        
        k1 = h*f(t(k), w(k));
        k2 = h*f(t(k) + h/3, w(k) + k1/3);
        k3 = h*f(t(k) + 2/3*h, w(k) + 2/3*k2);
        
        w(k+1,:) = w(k) + (k1 + 3*k3)/4;
        t(k+1,:) = t(k) + h;
        
        exact = (t(k+1,:) + 1)^2 - 0.5*exp(t(k+1,:));  
        error = norm(exact - w(k+1,:));  
        
    end       
    
    disp('Heun method completed.');      
    plot(t, w, '--b*');
    xlabel('Time (t)')
    ylabel('Function output per time step (w)')
    
    error
    
end


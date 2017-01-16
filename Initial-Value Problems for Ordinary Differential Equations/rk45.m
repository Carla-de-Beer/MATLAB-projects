function [t, w, error] = rk45(f, a, b, alpha, N)
% The Runge-Kutta Method (order 4) to solve an initial value problem
% Algorithm taken from:
% Burden, Faires, Burden. 2014. "Numerical Analysis". 10th Edition, Cengage
% Learning, p267
% Created: October 2015

    h = (b - a)/N; % or input h, and find N
    % N = (b-a)/h;
    t(1) = a;
    w(1) = alpha;

    for k = 1:N
        k1 = h*f(t(k), w(k));
        k2 = h*f(t(k) + h/2, w(k) + k1/2);
        k3 = h*f(t(k) + h/2, w(k) + k2/2);
        k4 = h*f(t(k) + h, w(k) + k3);
        
        % Find the next approximation
        w(k+1,:) = w(k) + (k1 + 2*k2 + 2*k3 + k4)/6;
        t(k+1,:) = t(k) + h;
               
        exact = 0.2*t(k+1,:)*exp(3*t(k+1,:)) - (1/25)*exp(3*t(k+1,:)) + (1/25)*exp(-2*t(k+1,:));
        error = norm(exact - w(k+1,:));          
    end
    
    fprintf('Runge-Kutta Method completed.\n');   
    plot(t, w, ':go');
    xlabel('Time (t)')
    ylabel('Function output per time step (w)')
    title('Runge-Kutta Method (order 4)');
    
    error
    
end
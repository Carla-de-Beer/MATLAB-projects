function [ t, w, error ] = eulerRK45Compare()
% EULERRK45COMPARE 
% Comparing the Euler Method and the Runge-Kutta Order 4 Method

 f = @(t,y) (y - t^2 + 1);
 a = 0; 
 b = 8; 
 alpha = 0.5;
 N = 20;
 
 title('Comparing Euler and Runge-Kutta Order 4')
 [ t, w ] = euler( f, a, b, alpha, N );
 hold on;
 [t, w, error] = rk45(f, a, b, alpha, N)
 legend('Euler','RK45', 'Location', 'southwest')

end


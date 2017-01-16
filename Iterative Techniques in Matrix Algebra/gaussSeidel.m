 function x = gaussSeidel(A, b, x0, TOL, N)
% The Gauss-Seidel iterative method to solve Ax = b, given an initial approximation x(0)
% Algorithm taken from:
% Burden, Faires, Burden. 2014. "Numerical Analysis". 10th Edition, Cengage Learning, p462
% Created: September 2015

    n = size(A,1);

    for k = 1:N

        for i = 1:n

          s = 0;
          for j = 1:i-1
              s = s + A(i,j)*x(j);
          end

          for j = i+1:n
              s = s + A(i,j)*x0(j);
          end

          x(i,1) = (b(i) - s)/A(i,i);

        end

        fprintf('Iteration %d: ',k);

        e = (x - x0)
        normE = norm(e);
        
        fprintf('Error norm: %f: ', normE);

        x

        if norm(x - x0) < TOL
            fprintf('Answer successfully calculated at: ');
            fprintf('Iteration %d: ', k);
            return;
        end

        x0 = x; % swap
    end

    fprintf('Max number of iterations exceeded.\n');

end

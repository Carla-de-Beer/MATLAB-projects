% LU factorisation of an input matrix
% Algorithm taken from: 
% Burden, Faires, Burden. 2014. "Numerical Analysis". 10th Edition, Cengage Learning, p410
% Created: August 2015

% Example variable:    A = [3, -1, 1; 3, 6, 2; 3, 3, 7]

function [L,U] = factorLU(A)

    n = size(A,1);
    L = eye(n); 
    U = zeros(n,n);
    
    %Elimination
    for i = 1:n-1
        p = i;
        while p <= n && A(p,i) == 0
            p = p+1;
        end
        if p == n+1 
            disp('The matrix is singular');
            L = NaN;
            U = NaN; 
            return
        end
        if p~=i
           disp('Row interchange required');
           L = NaN;
           U = NaN; 
           return
        end
        % Create L by adding m-values to the identity matrix
        for j = i+1:n
            m = A(j,i)/A(i,i);
            L(j,i) = m;
            for k = i+1:n
                A(j,k)= A(j,k)- m*A(i,k);
            end
        end
    end
    if A(n,n)== 0 
        disp('The matrix is singular');
        L = NaN;
        U = NaN; 
        return; 
    end

    % Create U by decanting A into the zero matrix
    for i = 1:n
        for j = i:n;
            U(i,j)= A(i,j);
        end
    end
end
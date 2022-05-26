x_0 = input("");
m = input("");
s = input("");
tol = 1e-06;


function A = format_matrix(m, s)
    n = size(m, 1);
    A = zeros(n);
    A(1, :) = m';
    
    for index = 1:(n - 1)
        A(index + 1, index) = s(index);
    endfor
endfunction


function [lambda,y,k] = potencias(A,tol, x_0)
    k = 0; 
    kmax = 1000; 
    erro = inf;
    n = size(A,1); 
    y0 = x_0;
    
    while (erro>tol && k<kmax)
        x = A*y0;
        y = x/norm(x);
        erro = abs(abs(y0'*y)-1);
        y0 = y; 
        k += 1;
    endwhile
    
lambda = y'*A*y;
endfunction


A = format_matrix(m, s);
[lamda, y, k] = potencias(A, tol, x_0);

disp('x = ');
disp(y);
fprintf('k = %d',k);


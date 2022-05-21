Matrix = [1 2 0; 1 3 1; -2 0 1]



function [L, U] = lu_decomp(Matrix)
order = size(Matrix, 1);

L = eye(order);
U = zeros(order);

for i = 1:order
    U(i, i:order) = Matrix(i, i:order)  - L(i, 1:(i - 1))*U(1:(i - 1), i:order);
    L((i + 1):order, i) = (Matrix((i + 1):order, i) - L((i + 1):order, 1:i)*U(1:i, i))/U(i, i);
end
endfunction

function [A] = blocna2(n)
%function [A] = blocna2(n)

nn = n^2;


A = diag(-4*ones(nn, 1)) + diag(ones(nn - n, 1), n) + diag(ones(nn - n, 1), -n);
dd = ones(nn - 1, 1);
dd(n:n:end) = 0;
A = A + diag(dd, 1) + diag(dd, -1);


end


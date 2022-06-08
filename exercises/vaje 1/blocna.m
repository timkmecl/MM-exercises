function [A] = blocna(n)
%function [A] = blocna(n)

T = diag(-4*ones(n, 1)) + diag(ones(n-1, 1), 1) + diag(ones(n-1, 1), -1);
I = eye(n);

A = kron(eye(n), T) + kron(diag(ones(n-1, 1), 1) + diag(ones(n-1, 1), -1), I);

end


function [M] = druga(n)
%function [M] = druga(n)

M = diag(1:n) + diag(ones(n-1, 1), -1) + diag(-ones(n-2, 1), -2);
M = M + triu(4*ones(n), 1);

end


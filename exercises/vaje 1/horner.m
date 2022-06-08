function [val] = horner(a, x)
%function [val] = horner(a, x)

n = size(a(:), 1);
a = a(n:-1:1);

b = a(n);
for i = (n-1):-1:1
    b = x*b + a(i);
end

val = b;
end


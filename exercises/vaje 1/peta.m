function [A] = peta(m, n)
%function [A] = peta(m, n)

stolpec1 = (1:m)';
vrstica1 = 1:n;

stolpec2 = (stolpec1 + 1).^-3;
vrstica2 = (vrstica1 - 4).^2;

A = stolpec2.*vrstica2 + stolpec1.*vrstica1;

end


function z = zvVeriznica_iteracijskaFun(T1,T2,l,z0,tol)
% function z = zvVeriznica_iteracijskaFun(T1,T2,l,z0,tol)
% Iteracijska funkcija zvVeriznica_iteracijskaFun resi enacbo z=asinh(ro*z)
% za zvezno veriznico.
% 
% Vhod
% T1=[a;A]:    levo obesisce
% T2=[b;B]:    desno obesisce
% L:           dolzina veriznice
% z0:          zacetni priblizek
% tol:         toleranca pri ustavitvi iteracije
%
% Izhod
% z:        numericna resitev enacbe z=asinh(ro*z)
%

a = T1(1);
b = T2(1);
A = T1(2);
B = T2(2);

ro = (l / (b-a)) * sqrt(1 - ((B-A) / l)^2);
f = @(z) asinh(ro*z);

z = z0;
zp = z + 2*tol;

while abs(z - zp) > tol
    zp = z;
    z = f(z);
end


end

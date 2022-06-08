function [r,u] = upogib_opne(f,R,n)
% function [r,u] = upogib_opne(f,R,n)
%
% upogib_opne racuna obliko prereza opne, napete na krozno zanko
% r je delitev v radialni smeri
% u je vektor priblizkov za resitev
% f je desna stran enacbe u''+1/r u' = f(r)
% R je radij krozne zanke
% n je stevilo delilnih intervalov (indeksi: 0,1,2,...,n)
% uporabimo kompakten zapis matrike s 3 stolpci (resi3.m)



% diskretna mreza r-jev in velikost celic h

rr = linspace(0, R, n+1)';
r = rr(1:(end-1));

h = R/n;

% desna stran

ff = h^2 * f(r);



% diagonale

b = -2 * ones(n, 1);
a = 1 - h ./ (2*r(2:end));
c = 1 + h ./ (2*r(1:(end-1)));
c(1) = 2;

% resimo 3-diag sistem


uu = resi3(a,b,c,ff);
u = [uu; 0];
r = rr;


% narisi u(r)

figure
plot(r, u)



% narisi u(x,y) preko surf [neobvezni dodatek]

phi = linspace(0, 2*pi, n+1);
[rr, pphi] = ndgrid(r, phi);
x = rr.*cos(pphi);
y = rr.*sin(pphi);
uu = ones(size(u))' .* u;

figure
surf(x, y, uu)
shading interp




end
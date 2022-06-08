%plot([1 0 2], [1, 5, 3], 'o--', 'Linewidth', 2, 'Color', [1,0,1])
%hold on

x = linspace(1,3);
f = @(x) sin(x) .* exp(sqrt(x));
plot(x, f(x))

x2 = linspace(0,2*pi);
g = @(x) [cos(x); sin(x)];
gg = g(x2);
plot(gg(1, :), gg(2, :))

x3 = linspace(0, 10*pi);
h = @(x) [cos(x); sin(x); x];
hh = h(x3);
plot3(hh(1, :), hh(2, :), hh(3, :))

x4 = linspace(0, 1);
y4 = linspace(0, 1);
[xx, yy] = ndgrid(x4, y4);
k = @(x, y) (x.^2 + y.^2)./(1 + x + y);
surf(xx, yy, k(xx, yy))
shading interp



r = linspace(1, 2);
phi = linspace(0, 10*pi);
[rr, pphi] = ndgrid(r, phi);

z = @(r, phi) r.*phi;
zz = z(rr, pphi);

tocartx = @(r, phi) r.*cos(phi);
tocarty = @(r, phi) r.*sin(phi);
x = tocartx(rr, pphi);
y = tocarty(rr, pphi);

surf(x, y, zz);
shading interp




f = @(x, y) sin(x.^2 - y.^4) ./ (x.^2 - y.^4);
[x, y] = ndgrid(0:0.01:1, 0:0.01:2);
ff = f(x, y);
surf(x, y, ff);

hold on
ff(isnan(ff)) = 1;
surf(x, y, ff);
shading interp

ma = ff == max(max(ff))
xma = x(ma)
yma = y(ma)
scatter3(xma, yma, ff(ma));






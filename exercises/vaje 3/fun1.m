function dy = fun1(tK, rhoz)
%function dy = fun1(tK)

y0 = 40000;

g0 = 9.81;
m = 105;
S = 1.2;
cu = 1;
r = 6371000;
g = @(y) g0 * (r / (r + y))^2;



f =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu*S*Y(2)*abs(Y(2)) / (2*m);
F = @(t, Y) [Y(2); f(t, Y)];

t = linspace(0, tK, 10000);

[~, Y] = ode45(F, t, [y0; 0]);

dy = Y(end, 2);

end


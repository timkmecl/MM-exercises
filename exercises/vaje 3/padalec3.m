y0 = 40000;

g0 = 9.81;
m = 105;
S = 1.2;
cu = 1;
r = 6371000;
rhoz = 1.225;
g = @(y) g0 * (r / (r + y))^2;

f =  @(t, Y) -g(Y(1)) - rhoz*cu*S*Y(2)*abs(Y(2)) / (2*m);
F = @(t, Y) [Y(2); f(t, Y)];

tK = 300;
t = linspace(0, tK, 10000);

[~, Y] = ode45(F, t, [y0; 0]);

Y(end, 1)


figure
plot(t, Y(:,1))
figure
plot(t, Y(:,2))
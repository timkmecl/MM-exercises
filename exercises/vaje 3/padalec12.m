y0 = 40000;

g0 = 9.81;
m = 105;
S = 1.2;
cu = 1;

rhoz = 1.225;
f =  @(t, Y) -g0 - rhoz*cu*S*Y(2)*abs(Y(2)) / (2*m);
F = @(t, Y) [Y(2); f(t, Y)];

tK = 300;
t = linspace(0, tK, 10000);

[~, Y] = ode45(F, t, [y0; 0]);
mean(Y(:,2))

sqrt(g0*2*m / (rhoz*cu*S))

figure
plot(t, Y(:,1))
figure
plot(t, Y(:,2))
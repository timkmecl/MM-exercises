y0 = 40000;

g0 = 9.81;
m = 105;
S = 1.2;
cu = 1;
r = 6371000;
rhoz = 1.225;
g = @(y) g0 * (r / (r + y))^2;


visine = [0 2000 4000 6000 8000 10000 15000 20000 25000 30000 40000]';
gostote = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996]';
A = [ones(size(visine)), ((visine - 40000)/40000).^2, ((visine - 40000)/40000).^4];
x = A \ gostote;
rhoz = @(y) x(1) + x(2)*((y-40000)/40000)^2 + x(3)*((y-40000)/40000)^4;


f =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu*S*Y(2)*abs(Y(2)) / (2*m);
F = @(t, Y) [Y(2); f(t, Y)];

tK = 30;
t = linspace(0, tK, 10000);

[~, Y] = ode45(F, t, [y0; 0]);
[~, Y2] = ode45(F, t, [y0; -3]);

Y2(end, 2) - Y(end, 2)

figure
plot(t, Y(:,1))
hold on
plot(t, Y2(:,1))
hold off
figure
plot(t, Y(:,2))
hold on
plot(t, Y2(:,2))
hold off
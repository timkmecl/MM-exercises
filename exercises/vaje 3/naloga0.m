f = @(t, y) 2*t;
y0 = 1;
t = linspace(0, 5, 1001);
[~, y] = ode45(f, t, y0);

figure 
plot(t, y);



f = @(t, Y) 6*t;
y0 = 1;
dy0 = 0;
Y0 = [y0; dy0];
t = linspace(0, 5, 1001);
F = @(t, Y) [Y(2); f(t, Y)];
[~, Y] = ode45(F, t, Y0);

figure
plot(t, Y(:, 1))
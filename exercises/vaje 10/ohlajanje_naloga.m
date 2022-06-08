f = @(x) sin(10*x) + (1/3)*cos(2*x) + (1/10)*(x - 5).^2;
x0 = 0;
x = ohlajanje(f, x0, 0.5)
fx = f(x)

xs = linspace(0, 10, 1000);
plot(xs, f(xs))
hold on
plot(x, f(x), 'o')
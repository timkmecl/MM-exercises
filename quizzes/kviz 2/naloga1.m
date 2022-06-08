g = 9.81;
T0 = [1; 5.75];
T1 = [6.65; 3.5];

% 1
[x, y, t, len, k, theta, dx, dy] = brah(T0, T1, g, 1000);
t_prem = sqrt(-2*((T1(2) - T0(2))^2 + (T1(1) - T0(1))^2) / (g * (T1(2) - T0(2))));
k1 = t_prem/t;

% 2
len2 = len;

% 3
t = (k / sqrt(2*g)) * pi;

% 4
% figure
% axis equal
% ths = linspace(0, theta, 1000);
% plot(x(ths), y(ths));
k = dy(theta) / dx(theta);
h = T0(2) - T1(2);
W = g*h;
v = sqrt(2*W);
vx = sqrt(v^2 / (1 + (dy(theta)/dx(theta)).^2));
vy = sqrt(v^2 / (1 + (dx(theta)/dy(theta)).^2));

tt = fzero(@(t) -(g*t.^2)/2 + vy.*t + T1(2), sqrt(2*T1(2)/g));
x4 = vx*tt + T1(1);

% 5
R = 8.6;
dU1 = -0.05;
dydx2 = @(y) (4/9) * (R-y.^3) ./ y.^4;
dU = @(A, y) -A ./ (1 + dydx2(y));
A = fzero(@(A) dU(A, -0.5) - dU1, 1);
dU5 = dU(A, -1)

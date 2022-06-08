T0 = [1;5];
T1 = [6;2];
g = 9.81;

% 1 čas
[x, y, t, len, k, theta, dx, dy] = brah(T0, T1, g, 1000);
t1 = t

% 2 odsekoma ravna
T12 = [3;2];
t_prem1 = sqrt(-2*((T12(2) - T0(2))^2 + (T12(1) - T0(1))^2) / (g * (T12(2) - T0(2))));
h = T0(2) - T12(2);
W = g*h;
v = sqrt(2*W);
l = T1(1) - T12(1);
t_prem2 = l/v;
t2 = t_prem1 + t_prem2

% 3 hitrost
h = T0(2) - y(pi);
W = g*h;
v = sqrt(2*W)

% 4 nova krajišče
% t = (k / sqrt(2*g)) * theta;
t = 1.5;
theta4 = t / (k / sqrt(2*g));
T2 = [x(theta4), y(theta4)];
norm4 = norm(T2)

% 5 potencialno
% x3 + y3 = R
% 3x2 dx + 3y2 dy = 0
% dy/dx = -x2/y2
R = 8;
dU1 = -0.062602467658770;
dydx2 = @(y) ((R-y.^3).^(4/3)) ./ y.^4;
dU = @(A, y) -A ./ (1 + dydx2(y));
A = fzero(@(A) dU(A, -1) - dU1, 1);
dU2 = dU(A, -2)
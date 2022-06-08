
visine = [0 2000 4000 6000 8000 10000 15000 20000 25000 30000 40000]'; 
gostote = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996]';


A = [ones(size(visine)), ((visine - 40000)/40000).^2, ((visine - 40000)/40000).^4];
x = A \ gostote;
rhoz = @(y) x(1) + x(2)*((y-40000)/40000)^2 + x(3)*((y-40000)/40000)^4;


y0 = 40000;

g0 = 9.81;
m = 101;
S = 0.9;
cu = 1.2;
r = 6371000;
g = @(y) g0 * (r / (r + y))^2;

N = 10000;
f =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu*S*Y(2)*abs(Y(2)) / (2*m);
F = @(t, Y) [Y(2); f(t, Y)];


% 1

tk = 30;
t = linspace(0, tk, N);
[~, Y] = ode23s(F, t, [y0; 0]);
v1 = Y(end, 2);


% 2

cu2 = cu;
S2 = S*2;
m2 = m*2;
f2 =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu2*S2*Y(2)*abs(Y(2)) / (2*m2);
F2 = @(t, Y) [Y(2); f2(t, Y)];

tk = 100;
t = linspace(0, tk, N);

[~, Y2] = ode23s(F2, t, [y0; 0]);
y2 = y0 - Y2(end, 1);


% 3

%cas3 = fzero(@(x) naloga3(x, rhoz) - 500, 100);


% 4

h_zrak = fzero(@(x) rhoz(x) - 0.5, 10000);
%cas4 = fzero(@(x) naloga3(x, rhoz) - h_zrak, 100);


% 5

cas5 = fzero(@(x) naloga5(x, rhoz) - 500, 100)





function y = naloga3(tt, rhoz)
y0 = 40000;

g0 = 9.81;
m = 101;
S = 0.9;
cu = 1.2;
r = 6371000;
g = @(y) g0 * (r / (r + y))^2;

N = 10000;
f =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu*S*Y(2)*abs(Y(2)) / (2*m);
F = @(t, Y) [Y(2); f(t, Y)];

t = linspace(0, tt, N);
[~, Y] = ode23s(F, t, [y0; 0]);
y = Y(end, 1);
end

function y = naloga5(tt, rhoz)
y0 = 40000;

g0 = 9.81;
m = 101;
S = 0.9;
cu = 1.2;
r = 6371000;
g = @(y) g0 * (r / (r + y))^2;

N = 10000;
f =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu*S*Y(2)*abs(Y(2)) / (2*m);
F = @(t, Y) [Y(2); f(t, Y)];

t = linspace(0, 300, N);
[~, Y] = ode23s(F, t, [y0; 0]);

cu2 = 4*cu;
S2 = S + 8;
f2 = @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu2*S2*Y(2)*abs(Y(2)) / (2*m);
F2 = @(t, Y) [Y(2); f2(t, Y)];

t = linspace(300, tt, N);
[~, Y2] = ode23s(F2, t, [Y(end, 1); Y(end, 2)]);

y = Y2(end, 1);
end
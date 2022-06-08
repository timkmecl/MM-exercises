
visine = [0 2000 4000 6000 8000 10000 15000 20000 25000 30000 40000]'; 
gostote = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996]';


A = [ones(size(visine)), ((visine - 40000)/40000).^2, ((visine - 40000)/40000).^4];
x = A \ gostote;
rhoz = @(y) x(1) + x(2)*((y-40000)/40000)^2 + x(3)*((y-40000)/40000)^4;


y0 = 40000;

g0 = 9.81;
m = 90;
S = 0.9;
cu = 1;
r = 6371000;
g = @(y) g0 * (r / (r + y))^2;

N = 10000;
f =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu*S*Y(2)*abs(Y(2)) / (2*m);
F = @(t, Y) [Y(2); f(t, Y)];


tk = 25;
t = linspace(0, tk, N);
[~, Y] = ode23s(F, t, [y0; 0]);
l1 = 40000 - Y(end, 1);

% 2 =================================
t = linspace(0, 60, 10000);
[~, Y] = ode23s(F, t, [y0; 0]);
dy1 = Y(end, 2);

cu2 = cu + 0.1;
S2 = S + 0.1;
m2 = m + 100;
f2 =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu2*S2*Y(2)*abs(Y(2)) / (2*m2);
F2 = @(t, Y) [Y(2); f2(t, Y)];
[~, Y2] = ode23s(F2, t, [y0; 0]);
dy2 = Y2(end, 2);

deltay2 = abs(dy2 - dy1);



% 3 ===================================
t = linspace(0, 100, 10000);
[~, Y1] = ode23s(F, t, [y0; 0]);
vmax = min(Y1(:, 2));


% 4
f4(373.55, rhoz);
%fzero(@(t) f4_v2(t, rhoz), 100);

function y = f4(t_opt, rhoz)
y0 = 40000;

g0 = 9.81;
m = 90;
r = 6371000;
g = @(y) g0 * (r / (r + y))^2;

    function s = S2(t, t_opt)
        if t < t_opt
            s = 0.9;
        else
            s = 0.9 + 10;
        end
    end
    function cu = Cu2(t, t_opt)
        if t < t_opt
            cu = 1;
        else
            cu = 1 * 5;
        end
    end
S = @(t) S2(t, t_opt);
cu = @(t) Cu2(t, t_opt);

N = 10000;
f =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu(t)*S(t)*Y(2)*abs(Y(2)) / (2*m);
F = @(t, Y) [Y(2); f(t, Y)];


tk = 400;
t = linspace(0, tk, N);
[~, Y] = ode23s(F, t, [y0; 0]);
y = Y(end, 1);
end

function y = f4_v2(t_opt, rhoz)
y0 = 40000;

g0 = 9.81;
m = 90;
r = 6371000;
g = @(y) g0 * (r / (r + y))^2;

S1 = 0.9;
S2 = 0.9 + 10;
cu1 = 1;
cu2 = 1 * 5;

N = 1000;
f1 =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu1*S1*Y(2)*abs(Y(2)) / (2*m);
F1 = @(t, Y) [Y(2); f1(t, Y)];
f2 =  @(t, Y) -g(Y(1)) - rhoz(Y(1))*cu2*S2*Y(2)*abs(Y(2)) / (2*m);
F2 = @(t, Y) [Y(2); f2(t, Y)];

tk = 400;
t = linspace(0, t_opt, N);
[~, Y] = ode23s(F1, t, [y0; 0]);
t = linspace(t_opt, tk, N);
[~, Y] = ode23s(F2, t, [Y(end, 1); Y(end, 2)]);
y = Y(end, 1);
end


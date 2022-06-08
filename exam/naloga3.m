g = 9.81;
T0 = [1; 5.55];
T1 = [6.4; 3.5];

% 1
[x,y,t,len, k, theta, dx, dy] = brah(T0,T1, g,100);
s2 = fzero(@(th) (k / sqrt(2*g)) * th - t/2, theta/2);
n1 = sqrt(x(s2)^2 + y(s2)^2);
% 2
%x = fzero(@(x) druga(x) - 2, T1(1))
druga(11.36205254) % bisekcija part 2 electric boogaloo

% 3
gamma = @(s) s/theta;
kth = [dx(theta); dy(theta)]
T2 = T1 - theta*kth/3;
b = [T0, (T0 - [0; 1]), T2, T1];

n3 = norm(deCasteljau(b, 1/2))

% plotBezier(b)
% axis equal


% 4
db = odvod_bezier(b);
tm = fzero(@(t) [0, 1]*deCasteljau(db, t), 0.5);
ym = [0, 1]*deCasteljau(b, tm);
h = T0(2) - ym;

% V = g*T0(2)
% v = @(s) sqrt((V - g*[0, 1]*deCasteljau(b, s))/2);
% dt = @(s) norm(deCasteljau(db, s)) ./ (v(s)*theta);
% 
% t0 = 0.0001;
% t = integral(dt, t0, 1) + 2*(T0(2)-[0, 1]*deCasteljau(b, t0))/(v(0) + v(t0));
% tmin = fminbnd(@(t0) integral(dt, t0, 1) + 2*(T0(2)-[0, 1]*deCasteljau(b, t0))/(v(0) + v(t0)), 0.000001, 0.01)
% t0 = tmin;
% t = integral(dt, t0, 1) + 2*(T0(2)-[0, 1]*deCasteljau(b, t0))/(v(0) + v(t0))


dy = @(t) [0, 1]*deCasteljau(db, t);
dx = @(t) [1, 0]*deCasteljau(db, t);
y = @(t) T0(2) - [0, 1]*deCasteljau(b, t);

dt = @(s) sqrt(1 + (dy(s)./dx(s)).^2) ./ sqrt(2*g*(-y(s)));

dt = @(s) sqrt(dy(s).^2 + dx(s).^2) ./ sqrt(2*g*y(s));
t0 = 0.00000000001;
t = integral(dt, t0, 1)

function t = druga(xx)
g = 9.81;
T0 = [1; 5.55];
T1 = [xx; 3.5];
[x,y,t,len, k, theta, dx, dy] = brah(T0,T1, g,100);
t
end


function kontr = odvod_bezier(b)
    n = size(b, 2) - 1;
    kontr = n*(b(:, 2:end) - b(:, 1:(end-1)));
end
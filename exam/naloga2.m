A = [0; 1];
B = [3.5; 0.03];
l = 5.52;
x0 = A(1);

% 1
tol = 10e-10;
[T_min, w, wd] = zvVeriznica(A, B, l, tol);
k0 = wd(x0)

% 2
xm = T_min(1);
l1 = integral(@(x) sqrt(1+wd(x).^2), 0, xm);

C = [xm; 0];

[T_min1, w1, wd1] = zvVeriznica(A, C, l1, tol);
[T_min2, w2, wd2] = zvVeriznica(C, B, l - l1, tol);

y0 = min(T_min1(2), T_min2(2))

% 3
tretja(wd, 1.96092453) % haha na roke bisekcija ftw


% 4
ym = T_min(2);
max_dif = 2*10^(-3);
dif = Inf;
w0 = [-1,-1];

n = 5;


while dif > max_dif
n = n+1;
M = ones(1, n);
L = ones(1, n)*l/n;
x = diskrVeriznica(w0,A,B,L,M);
[y_min, i_min] = min(x(2, :));
T_mind = x(:, i_min);
dif = norm(T_min - T_mind);
end

n4 = n


% figure
% hold on
% xx = linspace(0, 3.5, 500);
% plot(xx, w(xx))
% plot(x(1,:), x(2,:), 'o-');



function dif = tretja(wd, x)
A = [0; 1];
B = [3.5; 0.03];
l = 5.52;
tol = 10e-10;
x;

l1 = integral(@(t) sqrt(1+wd(t).^2), 0, x);
C = [x; 0];
[T_min1, w1, wd1] = zvVeriznica(A, C, l1, tol);
[T_min2, w2, wd2] = zvVeriznica(C, B, l - l1, tol);
dif = T_min1(2) - T_min2(2);
end
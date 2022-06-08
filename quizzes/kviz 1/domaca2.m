A = [0.5; 1];
B = [3.5; 0.5];

L = [1,1,2,1,1.5,1];
M = L;

w0 = [-0.5,-1];
x = diskrVeriznica(w0,A,B,L,M);



% 1

vsota1 = sum(x(:, x(2, :) == min(x(2, :))));

%plot(x(1, :), x(2, :));

% 2
l2 = fzero(@(l) naloga2(l), 1);



% 3

R = @(fi) [cos(fi), -sin(fi); sin(fi), cos(fi)];
R0 = R(pi/4);
Ap  = R0 * A;
Bp = R0 * B;
xp = diskrVeriznica(w0,Ap,Bp,L,M);
x3 = R(-pi/4) * xp;
najnizja3 = x3(2, x3(2, :) == min(x3(2, :)))



% 4

l = sum(L);
[T_min,w, wd] = zvVeriznica(A,B,l,10e-10);
rho = 1;

tezisce = integral(@(x) x .* sqrt(1 + wd(x).^2), A(1), B(1)) / l;


% 5

x_low = fzero(wd, A(1));
y_low = w(x_low);

dif_y = abs(A(2) - y_low);
y0 = y_low + 0.75 * dif_y;
x0 = fzero(@(x) w(x) - y0, A(1));
dy0 = wd(x0);
g = 9.81;

v = sqrt(2*g*dif_y)/2;
abscisa5 = v / sqrt(1 + dy0^2);



function dif = naloga2(l)
w0 = [-0.5,-1];
A = [0.5; 1];
B = [3.5; 0.5];

i = 4;
L = [1,1,2,1,1.5,l];
M = L;

x = diskrVeriznica(w0,A,B,L,M);
dif = x(2, i) - x(2, i+1);
end
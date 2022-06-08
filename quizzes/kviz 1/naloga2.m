A = [0.3; 1.0];
B = [3.5; 0.8];

L = [1, 1, 2.5, 0.5, 0.5, 1, 1.2, 1];
M = L;
g = 9.81;


% 1

w0 = [-0.5,-1];
x = diskrVeriznica(w0,A,B,L,M);
min_y = x(2, x(2, :) == min(x(2, :)));


% 3

tezisca_y = (x(2, 1:(end-1)) + x(2, 2:end))/2;
Wp = sum(tezisca_y.*M)*g;


% 3

w0 = [0.5,1];
x = diskrVeriznica(w0,A,B,L,M);
max_y = x(2, x(2, :) == max(x(2, :)));


% 4

l = sum(L);
[T_min,w, wd] = zvVeriznica(A,B,l,10e-10);
rho = 1;
tezisce = integral(@(x) w(x) .* sqrt(1 + wd(x).^2), A(1), B(1)) / l;
Wp4 = tezisce*g*l;


% 5

l5 = fzero(@(x) naloga5(x) + 1, l);
x5 = fzero(@(x) dolzina_do_x(A(1), x, wd) - l5, 1);
y5 = w(x5)


% 6

% 1 2 3 4 # 5 6 ..
L6 = [1, 1, 2.5, 0.5, 1e-8, 0.5, 1, 1.2, 1];
M6 = L6;
M6(5) = 10;

w0 = [-0.5,-1];
x = diskrVeriznica(w0,A,B,L6,M6);
min_y6 = x(2, x(2, :) == min(x(2, :)))



function y_min = naloga5(l)
A = [0.3; 1.0];
B = [3.5; 0.8];
[T_min,w, wd] = zvVeriznica(A,B,l,10e-10);
y_min = T_min(2);
end

function len = dolzina_do_x(x0, x, wd)
len = integral(@(x) sqrt(1 + wd(x).^2), x0, x);
end

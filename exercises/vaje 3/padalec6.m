
visine = [0 2000 4000 6000 8000 10000 15000 20000 25000 30000 40000]';
gostote = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996]';
A = [ones(size(visine)), ((visine - 40000)/40000).^2, ((visine - 40000)/40000).^4];
x = A \ gostote;
rhoz = @(y) x(1) + x(2)*((y-40000)/40000)^2 + x(3)*((y-40000)/40000)^4;


fun2 = @(t) fun1(t, rhoz) - (-300);
t = fzero(fun2, 34)
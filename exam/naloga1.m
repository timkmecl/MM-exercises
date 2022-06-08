% 1
n = 20;
c = 2.02;
d = 0;

r = linspace(0, 2, n + 1);
f = c - r;
[r, u] = upogib_opne(f,2,n);
u0 = u(1)

% 2
n = 40;
c = 2.02;
d = 2.3;

r = linspace(0, 2, n + 1);
f = c - r;
[r, u] = upogib_opne(f,2,n);
u1 = u(n/2+1) + d
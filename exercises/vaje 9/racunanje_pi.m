function p = racunanje_pi(N)

x = rand(2, N);
r2 = sum(x.^2);
K = sum(r2 < 1);
p = 4*K/N;

end


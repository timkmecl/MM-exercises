function p = buffon2(t, l, n)
phi = rand(1, n)*pi;
d = rand(1, n)*(t/2);

y_spodaj = d - sin(phi)*(l/2);

seka = y_spodaj < 0;
p = sum(seka) / n;

end
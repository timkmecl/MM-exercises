function seka = buffon1(t, l)
while 1
    x = rand(1, 2);
    if sum(x.^2) < 1
        break
    end
end

d = rand()*(t/2);
y_spodaj = d - 0.5 * l * x(1)/norm(x);

seka = y_spodaj < 0;

end
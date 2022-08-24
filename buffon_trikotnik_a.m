function p = buffon_trikotnik_a(t, a)
%BUFFON_TRIKOTNIK_A analitično izračuna verjetnost p, da enakostranični trikotnik seka črto
%p = BUFFON_TRIKOTNIK_A(t, a)
%   t je razmik črt
%   a je dolžina stranice trikotnika
%t in a sta lahko vektorja enakih dimenzij, v tem primeru bo tudi p vektor
%verjetnosti za pripadajoči par elementov iz t in a.

p = ones(size(t));

% glede na razmerje med a in t uporabi različno formulo za izračun
% verjetnosti
s = a <= t;
p(s) = 3*a(s) ./ (pi*t(s));

s = (a > t) & (a < 2*sqrt(3)*t / 3);
p(s) = (6/pi) * (a(s)./(2*t(s)) - sqrt(a(s).^2 - t(s).^2)./t(s) + acos(t(s)./a(s)));

end


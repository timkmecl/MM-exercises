function p = buffon_kovanec_a(t, r)
%BUFFON_KOVANEC_A analitično izračuna verjetnost p, da kovanec seka črto
%p = BUFFON_KOVANEC_A(t, r)
%   t je razmik črt
%   r je polmer kovanca
%t in r sta lahko vektorja enakih dimenzij, v tem primeru bo tudi p vektor
%verjetnosti za pripadajoči par elementov iz t in r.
    
p = ones(size(t));
% verjetnost je manjša od ena le, če velja spodnji pogoj
s = 2*r < t;
p(s) = 2*r(s)./t(s);

end


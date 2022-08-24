function p = buffon_kovanec(t, r, n)
%BUFFON_KOVANEC numerično izračuna verjetnost p, da kovanec seka črto
%p = BUFFON_KOVANEC(t, r, n)
%   t je razmik črt
%   r je polmer kovanca
%   n je št. metov kovanca v simulaciji

% generira naključne y-koordinate središč kovancev med 0 in t (med prvima
% dvema črtama)
y = t .* rand(1, n);
% za vsakega preveri, ali ne seka črt
seka = (y + r > t) | (y - r < 0);

% izračuna verjetnost komplementarnega dogodka
p = sum(seka) / n;
end


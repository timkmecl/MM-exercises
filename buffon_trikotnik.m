function p = buffon_trikotnik(t, a, n)
%BUFFON_TRIKOTNIK numerično izračuna verjetnost p, da enakostranični trikotnik seka črto
%p = BUFFON_TRIKOTNIK(t, a, n)
%   t je razmik črt
%   a je dolžina 
%   n je št. metov trikotnika v simulaciji

% generira naključne y-koordinate središč trikotnikov med 0 in t (med prvima
% dvema črtama) in kot med 0 in 2*pi
y_s = t .* rand(1, n);
phi = rand(1, n) * 2*pi;

% oddaljenost oglišč od središa
b = a * sqrt(3)/3;

% izračuna y koordinate oglišč trikotnikov
y = zeros(3, n);
y(1, :) = y_s + b*cos(phi - pi/6);
y(2, :) = y_s + b*cos(phi - pi/6 - 2*pi/3);
y(3, :) = y_s + b*cos(phi - pi/6 - 4*pi/3);


seka = sum((y > t) | (y < 0)) > 0;
p = sum(seka)/n;

end


function tocka = deCasteljau(b,t)
% DE_CASTELJAU izracuna tocko na Bezierovi krivulji pri parametru t
% s pomocjo de Casteljauovega algoritma.
% Stolpci matrike b so kontrolne tocke Bezierove krivulje.


n = size(b, 2);
d = size(b, 1);
m = size(t, 2);
tocka = zeros(d, m);
for j = 1:d
    c = zeros(n, m);
    c = c + b(j, :)';
    for i = (n-1):-1:1
       c(1:i, :) = (1-t) .* c(1:i, :) + t .* c(2:(i+1), :);
    end
    tocka(j, :) = c(1, :);
end

end
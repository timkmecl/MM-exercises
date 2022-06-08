function seka = seka_mnogokotnik(l,P)
% Doloci, ali premica l seka konveksno ogrinjaco tock P (=mnogokotnik) ali ne.
% Premica l je podana v obliki l = [tocka, smerni].
% Mnogokotnik P je dolocen s tabelo 2xn oglisc po stolpcih

tocka = l(:, 1);
smerni = l(:, 2);

P = P - tocka;
normala = [0, -1; 1, 0] * smerni;

stran = (normala') * P;
seka = abs(sum(sign(stran))) ~= size(P, 2);

end
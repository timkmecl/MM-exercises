function Tp = presek_s_premico(b,l,tol)
% Poisce presek ravninske Bezierove krivulje 
% s premico l podano s tocko P in smernim vektorjem s.
% Presek se izracuna preko kontrolnega poligona krivulje b, subdivizije sub_demo in metode seka_mnogokotnik

% 
% Tp je tabela tock presecisc (ce ni presecisca, vrne prazno matriko)
% b je tabela 2x(n+1) kontrolnih tock po stolpcih
% l = [P,s]
% tol je natancnost, do katere isce presecisce.


radius = inf;

while radius > tol
    [k1, k2] = sub_demo(b, 0.5);
    if seka_mnogokotnik(l, k1)
        b = k1;
    elseif seka_mnogokotnik(l, k2)
        b = k2;
    else
        break
    end
    
    radius = max(norm(b - mean(b, 2)));

end

Tp = mean(b, 2);


end
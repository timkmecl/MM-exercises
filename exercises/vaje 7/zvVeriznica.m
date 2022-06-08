function [T_min,w] = zvVeriznica(obesisceL,obesisceD,L,tol)
% function [T_min,w] = zvVeriznica(obesisceL,obesisceD,L,tol)
% Funkcija zvVeriznica doloci (in narise) zvezno veriznico w in poisce njeno najnizjo tocko.
%
% Po knjigi Matematicno modeliranje (E. Zakrajsek).
%
% Vhod
% obesisceL, obesisceD: levo in desno obesisce veriznice, obesisceL=[a;A], obesisceD=[b;B]
% L:                    dolzina
% tol:                  toleranca pri iteraciji
%
% Izhod
% T_min:                najnizja tocka veriznice
% w:                    funkcija ('function handle') w, ki opisuje visino veriznice v tocki x
%

a = obesisceL(1);
b = obesisceD(1);
A = obesisceL(2);
B = obesisceD(2);

z = zvVeriznica_iteracijskaFun(obesisceL, obesisceD, L, 1, tol);

v = atanh((B - A)/L) + z;
u = atanh((B - A)/L) - z;
C = (b - a) / (v - u)
D = (a*v - b*u) / (v - u)

lambda = A - C * cosh((a - D) / C);


w = @(x) lambda + C .* cosh((x - D) ./ C);

T_min = [D; lambda + C];

figure;
grid on;
hold on;
xx = linspace(a, b, 200);
plot(xx, w(xx));
scatter([a, b, T_min(1)], [A, B, T_min(2)]);

end
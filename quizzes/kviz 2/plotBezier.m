function plotBezier(b)
% PLOTBEZIER izrise Bezierovo krivuljo in kontrolni poligon. Za izracun
% tocke na krivulji uporabimo deCasteljauov algoritem.
% Stolpci matrike b so kontrolne tocke Bezierove krivulje.

t = linspace(0, 1, 1000);
tocke = deCasteljau(b, t);

figure
axis equal
plot(tocke(1,:), tocke(2,:));
hold on
plot(b(1,:), b(2,:), '-o');


end
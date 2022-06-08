function zrcali_bezier(b)
% ZRCALI_BEZIER prezrcali Bezierovo krivuljo, podano s kontrolnimi
% tockami b, preko premice p, dolocene z zacetno in koncno kontrolno tocko.
% Izrise tudi zacetno in prezrcaljeno krivuljo ter oba kontrolna poligona.


p = b(:,end) - b(:, 1);
p = p / norm(p);

pr = b - b(:, 1);
pr = p .* (p' * pr) + b(:, 1);
b1 = 2*(pr - b) + b;


figure
hold on
axis equal
plotBezier(b);
plotBezier(b1);


end
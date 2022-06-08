function rotiraj_bezier(b,phi)
% ROTIRAJ_BEZIER rotira Bezierovo krivuljo, podano s kontrolnimi
% tockami b, za kot phi okrog prve kontrolne tocke. Izrise tudi
% zacetno in rotirano krivuljo ter oba kontrolna poligona.

R = @(phi) [cos(phi), -sin(phi); sin(phi), cos(phi)];

b1 = b - b(:, 1);
b1 = R(phi) * b1;
b1 = b1 + b(:, 1);

figure
hold on
axis equal
plotBezier(b);
plotBezier(b1);

end
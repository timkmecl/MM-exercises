function premakni_bezier(b,s)
% PREMAKNI_BEZIER translira Bezierovo krivuljo, podano s kontrolnimi
% tockami b, za vektor s. Izrise tudi zacetno in translirano krivuljo
% ter oba kontrolna poligona. 

b1 = b + s;
figure
hold on
axis equal
plotBezier(b);
plotBezier(b1);

end

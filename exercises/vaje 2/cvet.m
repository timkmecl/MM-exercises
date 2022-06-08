function [] = cvet(a, b, n)
%function [] = cvet(a, b, n)

t = linspace(0, 2*pi);
elipsa = @(t, a, b) [a*sin(t); b*cos(t)];
el = elipsa(t, 3, 1);

rot = @(fi) [cos(fi), -sin(fi); sin(fi), cos(fi)];

for i = 0:(n-1)
    elr = rot(i*2*pi/n) * el;
    plot(elr(1,:), elr(2, :), 'Color', [sin(i*4*pi/n), sin(i*4*pi/n + 2*pi/3), sin(i*4*pi/n + 4*pi/3)]/2 + 0.5);
    %plot(elr(1,:), elr(2, :));
end
axis equal;

end


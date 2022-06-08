bC = [0 1 2 3 4 2 1.5 1; 0 2 -1 1 3 2 1 0];

% 1 transf
R = @(phi) [cos(phi), -sin(phi); sin(phi), cos(phi)];

phi = pi;
b1 = bC - bC(:, 1);
b1 = R(phi) * b1;
b1 = b1 + bC(:, 1);
b1 = b1 + (bC(:, end) - bC(:, 1));
c1 = deCasteljau(b1, 1/3);
norm1 = norm(c1)


% 2 samopresecisce divizija
t = fsolve(@(t) deCasteljau(bC, t(1)) - deCasteljau(bC, t(2)), [0.1;0.9], optimset('TolFun',1e-16));
[b1, b2] = sub_demo(bC, t(1));
t = fsolve(@(t) deCasteljau(bC, t(1)) - deCasteljau(b2, t(2)), [0.1;0.9], optimset('TolFun',1e-16));
[b2, b3] = sub_demo(b2, t(2));
c2 = deCasteljau(b2, 1/3);
norm2 = norm(c2)


% 3 tezisce x
b = bC;
db = odvod_bezier(b);
masa = integral(@(t) norm(deCasteljau(db, t)), 0, 1, 'ArrayValued', true);
tez_x = integral(@(t) ([1, 0]*deCasteljau(b, t)) .* norm(deCasteljau(db, t)), 0, 1, 'ArrayValued', true) / masa


% 4 ordinata min l
y4 = fminsearch(@(y) cetrta(b, y), b(2,4));
b4 = b;
b4(2,4) = y4;
db4 = odvod_bezier(b4);
l4 = integral(@(t) norm(deCasteljau(db4, t)), 0, 1, 'ArrayValued', true)


% 5 reparam
db = odvod_bezier(b);
ddb = odvod_bezier(db);
l = integral(@(t) norm(deCasteljau(db, t)), 0, 1, 'ArrayValued', true);
tt = @(s) naravna(b, db, l, s);
h = 1e-10;
s = 3;
dc1 = deCasteljau(db, tt(s-h));
dc1 = dc1 / norm(dc1);
dc2 = deCasteljau(db, tt(s+h));
dc2 = dc2 / norm(dc2);
ddc = (dc2 - dc1) / (2*h);
x5 = ddc(1)


% figure
% hold on
% s = linspace(0, l, 50);
% t = zeros(size(s));
% for i = 1:50
%     t(i) = tt(s(i));
% end
% tocke = deCasteljau(b, t);
% plot(tocke(1,:), tocke(2,:));
% plotBezier(b);


function l = cetrta(b, y4)
b(2, 4) = y4;
db = odvod_bezier(b);
l = integral(@(t) norm(deCasteljau(db, t)), 0, 1, 'ArrayValued', true);
end


function tt = naravna(b, db, l, s)
ll = @(tt) integral(@(t) norm(deCasteljau(db, t)), 0, tt, 'ArrayValued', true);
tt = fzero(@(t) ll(t) - s, s/l);
end

function kontr = odvod_bezier(b)
    n = size(b, 2) - 1;
    kontr = n*(b(:, 2:end) - b(:, 1:(end-1)));
end

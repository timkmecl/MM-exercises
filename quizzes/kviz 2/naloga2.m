bC = [0.00 1.00 2.00 3.07 4.00 2.04 3.00; 0.00 2.00 -0.97 -1.00 3.00 2.00 1.00]; 
b = bC;


% 1
db = odvod_bezier(b);
db1 = deCasteljau(db, 0);
vel1 = norm(db1)


% 2
%plotBezier(b);
t = fsolve(@(t) deCasteljau(bC, t(1)) - deCasteljau(bC, t(2)), [0.6;1], optimset('TolFun',1e-16));
[b1, b2] = sub_demo(bC, t(1));
m = mean(b2,2);
my2 = m(2);

% 3
b2(:, end) = b2(:, 1);
%plotBezier(b2);
db2 = odvod_bezier(b2);
d1 = db2(:,1);
d2 = -db2(:, end);

cs = d1'*d2 / (norm(d1) * norm(d2));
phi = acos(cs);

% 4
db = odvod_bezier(b);
ddb = odvod_bezier(db);
k = kappa(@(t) deCasteljau(db, t), @(t) deCasteljau(ddb, t));
kabs = @(t) abs(k(t));
t = fminsearch(@(t) - abs(k(t)), 0.8, optimset('TolFun',1e-16));
maxk4 = kabs(t);


% 5
phi = fzero(@(phi) min_b(b, phi), 0);
br = rot_b(b, phi);
%plotBezier(br);
t = fminbnd(@(t) [0,1] * deCasteljau(br, t), 0.1, 1, optimset('TolFun',1e-16));
m = deCasteljau(b, t);
y5 = m(1)


function y = min_b(b, phi)
    b = rot_b(b, phi);
    t = fminbnd(@(t) [0,1] * deCasteljau(b, t), 0.1, 1, optimset('TolFun',1e-16));
    m = deCasteljau(b, t);
    y = m(2);
end

function br = rot_b(b, phi)
R = @(phi) [cos(phi), -sin(phi); sin(phi), cos(phi)];

b1 = b - b(:, 1);
b1 = R(phi) * b1;
b1 = b1 + b(:, 1);

br = b1;
end

function k = kappa(cd, cdd)
    function k = k2(t, cd, cdd)
        cdt = cd(t);
        cddt = cdd(t);
        pr = cdt(1,:).*cddt(2,:) - cdt(2,:).*cddt(1,:);
        k = pr./(sqrt(sum(cdt.^2)).^3);
    end
k = @(t) k2(t, cd, cdd);
end


function kontr = odvod_bezier(b)
    n = size(b, 2) - 1;
    kontr = n*(b(:, 2:end) - b(:, 1:(end-1)));
end
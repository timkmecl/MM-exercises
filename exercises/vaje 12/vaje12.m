b = [0, 1, 2, 4; 0, -1, -1, 2];
%plotBezier(b);

%s = [1;2];
%premakni_bezier(b, s);

%rotiraj_bezier(b, pi/2);

%zrcali_bezier(b);


% vprasanja
% 1
c1 = deCasteljau(b, 0.5);
c1 = c1(1);

% 2
bd = odvod_bezier(b);
nc2 = norm(deCasteljau(bd, 0.5), 2);

% 3
odd3 = norm(deCasteljau(b, 0.5), 2);

% 4
bdd = odvod_bezier(bd);
cd = fun(bd);
cdd = fun(bdd);
k = kappa(cd, cdd);
ukr4 = k(0.5);

% 5
[k1, k2] = sub_demo(b, 0.4);
sum6 = sum(k1');
sum6 = sum6(2);

% 6
t = fzero(@(t) vpr6(b, t), 0.5);
c6 = deCasteljau(b, t);
abs6 = c6(1);

% alt
l = [0, 1; 1, -1];
T = presek_s_premico(b, l, 10e-12);
abs6 = T(1);


% 7
b2 = visaj_stopnjo(b);
vsota7 = sum(b2')
vsota7 = vsota7(1);

% 8
t8 = fzero(@(t) [0, 1] * cd(t), 0.5);

% 9
t = fminsearch(@(t) norm(deCasteljau(b, t) - [2; 0.5]), 0.5);
dist9 = norm(deCasteljau(b, t) - [2; 0.5]);


function d = vpr6(b, t)
    T = deCasteljau(b, t);
    d = 1 - T(1) - T(2);
end



function f = fun(b)
    f = @(t) deCasteljau(b, t);
end

function kontr = odvod_bezier(b)
    n = size(b, 2) - 1;
    kontr = n*(b(:, 2:end) - b(:, 1:(end-1)));
end

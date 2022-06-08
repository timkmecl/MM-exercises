cx = @(t) -cos(t) + 2*cos(0.5*t);
cy = @(t) -sin(t) + 2*sin(0.5*t);
c = @(t) [-cos(t) + 2*cos(0.5*t); -sin(t) + 2*sin(0.5*t)];

% tt = linspace(0, 4*pi, 1000);
% figure
% cc = c(tt);
% plot(cc(1, :), cc(2, :));

% 1
oodaljenost = norm(c(1) - [0;0]);

% 2
cdx = @(t) sin(t) - sin(0.5*t);
cdy = @(t) -cos(t) + cos(0.5*t);
cd = @(t) [sin(t) - sin(0.5*t); -cos(t) + cos(0.5*t)];
len = dolzina(cd);

% 3
ploscina = -integral(@(t) cy(t) .* cdx(t), 0, 4*pi);


% 4
cdd = @(t) [cos(t) - 0.5*cos(0.5*t); sin(t) - 0.5*sin(0.5*t)];
k = kappa(cd, cdd);
kk = k(2*pi)

% 5
t1 = fzero(@(t) cx(t) + cy(t), 0);
T1 = c(t1);
t2 = fzero(@(t) cx(t) + cy(t), 2*pi);
T2 = c(t2);

% 6
c2 = @(t) [cos(t); sin(t)] .* (t/4);
tt = fsolve(@(t) (c(t(1)) - c2(t(2))), [0.1, 2*pi]);
T1 = c(tt(1));
tt = fsolve(@(t) (c(t(1)) - c2(t(2))), [3*pi, 2*pi]);
T2 = c(tt(1));

% tt = linspace(0, 4*pi, 1000);
% figure
% cc = c(tt);
% plot(cc(1, :), cc(2, :));
% hold on
% tt = linspace(0, 3*pi, 1000);
% cc = c2(tt);
% plot(cc(1, :), cc(2, :));

% 7
t1 = fzero(cdy, pi);
t2 = fzero(cdy, 3*pi);

% 8
A = [2;2];
t = fminbnd(@(t) norm(c(t) - A), 0, 4*pi);
dist = norm(c(t) - A);
% ali da je odvod pravokoten na razliko

% 9

alfa = fminsearch(@(a) deveta(a), -1/2)




function l = dolzina(cd)

l = integral(@(t) norm(cd(t)), 0, 4*pi, 'ArrayValued', true);

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


function i = deveta(alfa)
c = @(t) [alfa*cos(t) + 2*cos(0.5*t); alfa*sin(t) + 2*sin(0.5*t)];
cd = @(t) [-alfa*sin(t) - sin(0.5*t); alfa*cos(t) + cos(0.5*t)];
cdd = @(t) [-alfa*cos(t) - 0.5*cos(0.5*t); -alfa*sin(t) - 0.5*sin(0.5*t)];
k = kappa(cd, cdd);
i = integral(@(t) (k(t).^2).*sqrt(sum(cd(t).^2)), 0, 4*pi) + dolzina(cd);

end

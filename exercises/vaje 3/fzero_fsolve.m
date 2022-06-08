f = @(x) sin(x);
fzero(f, 3)

h = @(x) (x-1).^2;
fzero(h,1.1) % ne deluje, ker je dvojna nicla

fsolve(h,1.1) % ta pa deluje, vendar ni najbolj natancno


options = optimoptions('fsolve','Display','iter', 'TolFun', 1e-16);
fsolve(h,1.1, options) % dobimo priblizek, vendar ni najbolj natancen, ker je nicla veckratna

h = @(x) (x-1).^5;
fsolve(h,1.1, options)




% vhodna matematicna funkcija mora biti vedno odvisna od enega parametra!
% Primer:
% iscemo presek f1=0 in f2=0
f1 = @(x,y) x.^2 + y.^2 - 1;
f2 = @(x,y) (x-1).^2 + y.^2 - 1;

figure
fimplicit(f1,'linewidth',2)
hold on
fimplicit(f2,'linewidth',2)

% Sedaj moramo uporabiti fsolve, da poiscemo niclo. Vendar mora biti
% funkcija 1 vhodnega parametra.
F = @(x) [f1(x(1),x(2));f2(x(1),x(2))];
presek = fsolve(F,[0.5,0.5]);
plot(presek(1),presek(2),'.','Markersize',30,'color',[0 0 0],'MarkerFaceColor',[0 0 0])

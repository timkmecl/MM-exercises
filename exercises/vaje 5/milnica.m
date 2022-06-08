function milnica(a,n,f_spodaj,f_zgoraj,f_levo,f_desno,tol,metoda)
% MILNICA izracuna obliko milnice na kvadratu
% [-a,a] x [-a,a] , kjer so podane robne vrednosti
% s funkcijami f_i. Pri tem je:
% n+2 je stevilo delilnih tock na eni koordinatni osi
% f_i so stiri funkcije, ki dolocajo vrednosti na robu
% tol je toleranca pri iterativni metodi
% metoda je stikalo, ki doloca iterativno metodo:
%'Jacobi' = Jacobijevo iteracijo
%'Gauss-Seidel' = Gauss-Seidelovo iteracijo

rob = linspace(-a, a, n+2);
rob_levo = f_levo(rob);
rob_desno = f_desno(rob);
rob_zgoraj = f_zgoraj(rob);
rob_spodaj = f_spodaj(rob);

U = zeros(n+2);
U(1, :) = rob_zgoraj;
U(end, :) = rob_spodaj;
U(:, 1) = rob_levo;
U(:, end) = rob_desno;

U = metoda(U, tol, a);

% [x, y] = ndgrid(rob, rob);
% figure
% surf(x, y, U)

end
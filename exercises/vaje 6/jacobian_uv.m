function Z = jacobian_uv(W,L,vsote_mi)
% JACOBIAN_UV zgenerira Jacobijevo matriko v tocki W
% za sistem enacb (30) in (31) iz prilozenega clanka.
%
% Vhodni parametri:
% W = [u;v], kjer sta u in v iskani neznanki.
% (x_n+1, y_n+1) obesisci.
% L je vrstica, ki doloca dolzine palic.
% vsote_mi je vrstica kumulativnih vsot, definiranih v (33).

u = W(1);
v = W(2);

xi = L ./ sqrt(1 + (v - u * vsote_mi).^2);
eta = xi .* (v - u * vsote_mi);

dxi_du = (L ./ sqrt(1 + (v - u * vsote_mi).^2).^3) .* (2*(v - u * vsote_mi)) .* vsote_mi;
dxi_dv = -(L ./ sqrt(1 + (v - u * vsote_mi).^2).^3) .* (2*(v - u * vsote_mi));
dUdu = sum(dxi_du);
dUdv = sum(dxi_dv);

deta_du = dxi_du .* (v - u * vsote_mi) - xi .* vsote_mi;
deta_dv = dxi_du .* (v - u * vsote_mi) + xi;

dVdu = sum(deta_du);
dVdv = sum(deta_dv);


Z = [dUdu, dUdv; dVdu, dVdv];


end
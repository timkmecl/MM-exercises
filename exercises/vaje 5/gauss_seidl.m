function U = gauss_seidl(U,tol,a)
% GAUSS_SEIDL izvaja Gauss-Seidlovo metodo direktno na mrezi U,
% ki predstavlja diskretizacijo kvadrata [-a,a] x [-a,a]. V vsakem
% koraku iteracije je vsak element izracunan kot povprecje njegovih
% stirih sosedov. Pri tem je U matrika z niclami v notranjosti in
% vrednostmi na robu, dolocenimi z robnimi pogoji.
% tol je toleranca, ki doloca natancnost izracunane resitve.
n = size(U, 1) - 2;
diff = inf;

aa = linspace(-a, a, n+2);
[x, y] = ndgrid(aa, aa);

figure
surf(x, y, U)

nn = 0;
while diff > tol
    U1 = U;
    for i = 2:(n+1)
        for j = 2:(n+1)
            U(i, j) = (U(i-1, j) + U(i, j-1) + U(i+1, j) + U(i, j+1))/4;
        end
    end
    %diff = max(max(U - U1));
    
    surf(x, y, U);
    pause(.002);
    
    diff = norm(U - U1, 'fro');
    nn = nn+1;
end
nn
U = U1;
surf(x, y, U)

end
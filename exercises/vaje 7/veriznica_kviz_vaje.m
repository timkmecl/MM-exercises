function [dif] = veriznica_kviz_vaje(obesisceL,obesisceD,L,tol, y)

obesisceD(2) = y;
[T_min,w] = zvVeriznica(obesisceL,obesisceD,L,tol);

dif = T_min(1) - 2.5;

end


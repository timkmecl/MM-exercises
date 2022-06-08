function y = newton(F,JF,x0,delta)
% NEWTON izvaja Newtonovo metodo za resevanje sistema
% nelinearnih enacb, podanega z F in Jacobianom JF.
% Pri tem je x0 zacetni priblizek.
% Iteracija se konca, ko se zadnja priblizka razlikujeta
% za manj kot delta.

x = x0;
x_prev = x0 + 10*delta;
i = 0;
while sum(abs(x - x_prev)) >= delta
    i = i+1;
    x_prev = x;
    x = x - F(x)\JF(x);
end
i
y = x;

end
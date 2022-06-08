function P  = mojrand(p, q, a, c, m, x0)
    next_x = @(x) mod(a*x + c, m);
    x = x0;
    
    P = zeros(p, q);
    for i = 1:p
        for j = 1:q
            P(i, j) = x / m;
            x = next_x(x);
        end
    end
end
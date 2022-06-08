function b2 = visaj_stopnjo(b)

n = size(b, 2);
d = size(b, 1);
b2 = zeros(d, n+1);

b2(:, 1) = b(1);
b2(:, n+1) = b(n);

j = 1:(n-1);
b2(:, 2:n) = (j/(n+1)) .* b(:, 1:(n-1)) + (1 - j/(n+1)) .* b(:, 2:n);

end


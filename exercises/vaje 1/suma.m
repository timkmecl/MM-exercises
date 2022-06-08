function [pari] = suma(a, s)
%function [pari] = suma(a, s)

i = 1;
j = 1;
n = size(a(:), 1);

pari = zeros(1, 2);
m = 1;


while j < n
    while a(i) + a(j) < s && j < n
        j = j + 1
    end
    if a(i) + a(j) == s
        pari(m,:) = [a(i), a(j)]
        m = m + 1;
        j = j+1;
    end
    while a(i) + a(j) > s && i < j
        i = i + 1
    end
end

end


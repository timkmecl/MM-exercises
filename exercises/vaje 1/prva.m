A = [11 2 -3 0; 2 1 8 7; 0 22 21 -9; 4 -3 2 0; 5 1 10 -8];

a = max(max(A))
b = A' * A
c = A .* A

% find(A == 8) vrne zaporedni indeks

B = A(:, [1,2,3])
C = A(1:(end-1), [2,4])
A(1:(end-1), [2,4]) = 1

druga(8)

blocna2(3)

peta(3, 4)

p = [8,7,6,-5,1,1,-2];
x = 2.1234;
horner(p, x) - polyval(p, x)


suma([1,2,3,4,5,6,7,8,9], 3)
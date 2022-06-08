T1=[x1;y1]; 
T2=[x2;y2];

a = (y1 - y2) / (x1 - x2)^2

y = @(x) a(x - x2)^2 + y2

% y1 = a(x1 - x2)^2 + y2


%y = kx
%deltaU = -A / (1 + k^2) = konst.

% integral za čas je potem enak integralu za dolžino (do konstante)

A = rand(5, 4)
randi(100) % od 1 do 100
randi(100, 3, 2) % velikost matrike

A = rand(100);
histogram(A)
histogram(A, linspace(0, 1, 6))
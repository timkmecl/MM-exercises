function I = monte_carlo3(f,a1,b1,a2,b2,a3,b3,N)
% ne dela čist
x = rand(3, N) .* [(b1 - a1);(b2 - a2);(b3 - a3)]  + [a1; a2; a3];
y = f(x)
f_avg = sum(y / N);
I = f_avg * (b1 - a1)*(b2 - a2)*(b3 - a3);

end

% za integral večih spremenljivk generiramo naključne točke v n dimenzijah,
% ne smemo najprej generirati naključnih na intervalih in narediti
% kartezični produkt


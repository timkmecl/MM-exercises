function I = monte_carlo1(f, a, b, N)

x = rand(1, N) * (b - a) + a;
y = f(x);
f_avg = sum(y / N);
I = f_avg * (b - a);

end

% za integral večih spremenljivk generiramo naključne točke v n dimenzijah,
% ne smemo najprej generirati naključnih na intervalih in narediti
% kartezični produkt


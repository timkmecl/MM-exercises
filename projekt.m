% primerjava problema kovanca
t = 3;
r = 0.8;
p = buffon_kovanec_a(t, r);
n = round(10.^(2:0.5:8));
p_n = zeros(size(n));
for i = 1:size(n,2)
    p_n(i) = buffon_kovanec(t, r, n(i));
end

figure
semilogx(n, p_n)
title('Primerjava numerične in analitične rešitve meta kovancev (t=3, r=0.8)')
hold on
plot(n, ones(size(n))*p, '--')

xlabel('št. metov')
ylabel('P')
legend('numerično', 'analitično')
hold off


%primerjava trikotnika, t>a
t = 5;
a = 3;
p = buffon_trikotnik_a(t, a);
n = round(10.^(2:0.5:7));
p_n = zeros(size(n));
for i = 1:size(n,2)
    p_n(i) = buffon_trikotnik(t, a, n(i));
end

figure(2)
semilogx(n, p_n)
title('Primerjava numerične in analitične rešitve meta trikotnika (t=5, a=3)')
hold on
plot(n, ones(size(n))*p, '--')

xlabel('št. metov')
ylabel('P')
legend('numerično', 'analitično')
hold off


% primerjava trikotnika, a>t
t = 2;
a = 2.1;
p = buffon_trikotnik_a(t, a);
n = round(10.^(2:0.5:7));
p_n = zeros(size(n));
for i = 1:size(n,2)
    p_n(i) = buffon_trikotnik(t, a, n(i));
end

figure(3)
semilogx(n, p_n)
title('Primerjava numerične in analitične rešitve meta trikotnika (t=2, a=2.1)')
hold on
plot(n, ones(size(n))*p, '--')

xlabel('št. metov')
ylabel('P')
legend('numerično', 'analitično')
hold off
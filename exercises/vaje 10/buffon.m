
t = 1;
l = 1;

n = 100000;
c = 0;
for i = 1:n
    c = c + buffon1(t, l);
end
p = c / n
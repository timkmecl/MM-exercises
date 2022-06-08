function x = ohlajanje(f, x0, sigma)

% začetni približek in pripadajoča vrednost kriterijske funkcije
x = x0;
val = f(x);
% začetna in končna temperatura, faktor zmanjševanja temperature
T0 = 1;
T = 0.0001;
c = 0.9;
% število iteracij pri konstantni temperaturi
iter = 200;

while T0 > T
    for i = 1:iter
        %Poišči novega kandidata z v okolici trenutnega in izračunaj vrednost f(z).
        z = x + randn()*sigma;
        fz = f(z);
        delf = fz - val;
        % če je rešitev slabša, jo sprejmemo z določeno verjetnostjo
        if delf > 0
            prob = exp(-delf / T0);
            if rand() < prob
                sprejmi = 1;
            else
                sprejmi = 0;
            end
        % če je rešitev boljša, jo vedno sprejmi
        else
            sprejmi = 1;
        end
        if sprejmi
            x = z;
            val = fz;
        end
    end
    % zmanjšaj temperaturo
    T0 = T0 * c;
end
end
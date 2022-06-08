function x = randhat(n)
    x = zeros(n, 1);
    for i = 1:n
        while 1
            r1 = rand()*2 - 1;
            r2 = rand();
            if r2 <= rhohat(r1)
                x(i) = r1;
                break;
            end
        end
    end
end

function y = rhohat(x)
    if x <= 0
        y = x + 1;
    else
        y = 1 - x;
    end
end
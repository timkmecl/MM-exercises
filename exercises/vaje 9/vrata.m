function x = vrata(n,strategija)
%strategija=1 ostani, strategija=2 zamenjaj
count = 0;
for i = 1:n
    vrata_z_nagrado = randi(3);
    
    izbira = randi(3);
    
    x = [0,0];
    for j = 1:3
        if j ~= izbira && j ~= vrata_z_nagrado
            x(1) = j;
            x(2) = j;
        end
    end
    for j = 1:3
        if j ~= izbira && j ~= x(1) && j ~= vrata_z_nagrado
            x(2) = j;
        end
    end
    odprta = x(randi(2));
    
    
    for j = 1:3
        if j ~= izbira && j ~= odprta
            tretja = j;
        end
    end
    if strategija == 1
        izbira2 = izbira;
    else
        izbira2 = tretja;
    end
    
        
    if izbira2 == vrata_z_nagrado
        count = count + 1;
    end

end

x = count / n;
end


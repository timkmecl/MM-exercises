function k = kappa(cd, cdd)
    function k = k2(t, cd, cdd)
        cdt = cd(t);
        cddt = cdd(t);
        pr = cdt(1,:).*cddt(2,:) - cdt(2,:).*cddt(1,:);
        k = pr./(sqrt(sum(cdt.^2)).^3);
    end
k = @(t) k2(t, cd, cdd);
end
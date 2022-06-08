function x = kocke(n, n_kock)

if n_kock == 1
    x = randi(6, n, 1);
else
    x = sum(randi(6, n_kock, n));
end


end


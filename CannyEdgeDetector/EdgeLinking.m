function E = EdgeLinking(T_low, T_high, Mag)
    [m, n] = size(Mag);
    E = zeros(m, n);
    Mag2 = Mag;
    Mag(Mag < T_low) = 0;
    Mag2(Mag2 < T_high) = 0;
    
    for i = 1:m
        for j = 1:n
            if (Mag2(i, j) ~= 0)
                CheckCandidates(i, j, T_low, T_high, Mag, Mag2, E);
            end
        end
    end
    
    E = Mag2;
end
    
function candidate = CheckCandidates(i, j, T_low, T_high, Mag, Mag2, E)
    candidate = 0;
    for k = (i - 1):(i + 1)
        if ((k < 1) | (k > size(Mag, 1)))
            continue;
        end
        for l = (j - 1):(j + 1)
            if (((l < 1) | (l > size(Mag, 2))) | ((i == k) & (l == j)) | (E(k, l) == 1))
                continue;
            end
            if (Mag(k, l) > T_high)
                Mag2(k, l) = Mag(k, l);
                E(k, l) = 1;
                candidate = 1;
                return;
            elseif (Mag(k, l) > T_low)
                E(k, l) = 1;
                candidate = CheckCandidates(k, l, T_low, T_high, Mag, Mag2, E);
                if (candidate == 1)
                    Mag2(k, l) = Mag(k, l);
                    return;
                end
            end
        end
    end
end
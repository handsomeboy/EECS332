function E = EdgeLinking(T_low, T_high, Mag)

    % Setup the output matrix and the two threshold matrices.
    [m, n] = size(Mag);
    E = zeros(m, n);
    Mag2 = Mag;
    Mag(Mag < T_low) = 0;
    Mag2(Mag2 < T_high) = 0;
    
    % Operate on each element of the high threshold matrix.
    for i = 1:m
        for j = 1:n
            if (Mag2(i, j) ~= 0)
                % Recursive call to check 8-neighbors.
                CheckCandidates(i, j, T_low, T_high, Mag, Mag2, E);
            end
        end
    end
    
    % Set the output to the modified high threshold matrix.
    E = Mag2;
    
end

function candidate = CheckCandidates(i, j, T_low, T_high, Mag, Mag2, E)

    % Canary value for successful completion.
    candidate = 0;
    
    % Opeate on each 8-neighbor of the input pixel.
    for k = (i - 1):(i + 1)
        % Ignore pixels outside the image.
        if ((k < 1) | (k > size(Mag, 1)))
            continue;
        end
        
        for l = (j - 1):(j + 1)
            % Ignore pixels outside the image, the starting pixel,
            % and pixels that have already been checked.
            if (((l < 1) | (l > size(Mag, 2))) | ...
                ((i == k) & (l == j)) | (E(k, l) == 1))
                continue;
            end
            
            % Mark pixels above the high threshold, and cascade the match.
            if (Mag(k, l) > T_high)
                Mag2(k, l) = Mag(k, l);
                E(k, l) = 1;
                candidate = 1;
                return;

            % Recursively check pixels above the low threshold.
            elseif (Mag(k, l) > T_low)
                % Mark this pixel as visited.
                E(k, l) = 1;
                % Perform the recurisve call.
                candidate = CheckCandidates(k, l, T_low, T_high, Mag, Mag2, E);
                
                % Cascade the call stack if a match is found.
                if (candidate == 1)
                    Mag2(k, l) = Mag(k, l);
                    return;
                end
            end
        end
    end
    
end
function Mag_out = NonmaximaSuppress(Mag, Theta)
    [m, n] = size(Mag);
    Mag_out = zeros(size(Mag));
    
    for i = 2:(m-1)
        for j = 2:(n-1)
            pixel = Mag(i, j);
            dir = Theta(i, j);
            if ((dir > degtorad(-22.5)) & (dir <= degtorad(22.5)))
                if ((pixel > Mag((i - 1), j)) & (pixel > Mag((i + 1), j)))
                    Mag_out(i, j) = pixel;
                end
            elseif ((dir > degtorad(22.5)) & (dir <= degtorad(67.5)))
                if ((pixel > Mag((i + 1), (j + 1))) & ...
                    (pixel > Mag((i - 1), (j - 1))))
                    Mag_out(i, j) = pixel;
                end
            elseif ((dir > degtorad(-67.5)) & (dir <= degtorad(-22.5)))
                if ((pixel > Mag((i + 1), (j - 1))) & ...
                    (pixel > Mag((i - 1), (j + 1))))
                    Mag_out(i, j) = pixel;
                end
            elseif ((dir < degtorad(-67.5)) | (dir > degtorad(67.5)))
                if ((pixel > Mag(i, (j + 1))) & (pixel > Mag(i, (j - 1))))
                    Mag_out(i, j) = pixel;
                end
            end
        end
    end
end
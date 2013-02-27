function Mag_out = NonmaximaSuppress(Mag, Theta)

    % Setup the output matrix.
    [m, n] = size(Mag);
    Mag_out = zeros(size(Mag));
    
    % Apply nonmaxima suppression over the entire input image.
    for i = 2:(m-1)
        for j = 2:(n-1)
            pixel = Mag(i, j);
            dir = Theta(i, j);
            % Case 0 from the textbook (-pi/8 to pi/8).
            if ((dir > degtorad(-22.5)) & (dir <= degtorad(22.5)))
                if ((pixel > Mag((i - 1), j)) & (pixel > Mag((i + 1), j)))
                    Mag_out(i, j) = pixel;
                end
            % Case 1 from the textbook (??pi/8 to 3pi/8).
            elseif ((dir > degtorad(22.5)) & (dir <= degtorad(67.5)))
                if ((pixel > Mag((i + 1), (j + 1))) & ...
                    (pixel > Mag((i - 1), (j - 1))))
                    Mag_out(i, j) = pixel;
                end
            % Case 3 from the textbook (-3pi/8 to -pi/8).
            elseif ((dir > degtorad(-67.5)) & (dir <= degtorad(-22.5)))
                if ((pixel > Mag((i + 1), (j - 1))) & ...
                    (pixel > Mag((i - 1), (j + 1))))
                    Mag_out(i, j) = pixel;
                end
            % Case 2 from the textbook (-3pi/8 to -pi/2 and 3pi/8 to pi/2).
            elseif ((dir < degtorad(-67.5)) | (dir > degtorad(67.5)))
                if ((pixel > Mag(i, (j + 1))) & (pixel > Mag(i, (j - 1))))
                    Mag_out(i, j) = pixel;
                end
            end
        end
    end
    
end
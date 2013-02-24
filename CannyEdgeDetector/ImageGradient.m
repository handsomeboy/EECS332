function [Mag, Theta] = ImageGradient(img_in)

    % Setup the input matrix and the output matrices.
    %img_in = im2double(rgb2gray(imread(S)));
    Mag = zeros(size(img_in));
    Theta = zeros(size(img_in));

    % Apply the Sobel operator over the entire image.
    for i = 1:(size(img_in, 1) - 2)
        for j = 1:(size(img_in, 2) - 2)
            % Partial derivatives for pixel (i, j).
            Gx = ((img_in((i + 2), j) + (2 * img_in((i + 2), (j + 1))) + ...
                   img_in((i + 2), (j + 2))) - (img_in(i, j) + ...
                   (2 * img_in(i, (j + 1))) + img_in(i, (j + 2))));
            Gy = ((img_in(i, (j + 2)) + (2 * img_in((i + 1), (j + 2))) + ...
                   img_in((i + 2), (j + 2))) - (img_in(i , j) + ...
                   (2 * img_in((i + 1), j)) + img_in((i + 2), j)));

            % Magnitude of the pixel (i, j).
            Mag(i, j) = sqrt((Gx .^ 2) + (Gy .^ 2));

            % Direction of the pixel (i, j).
            Theta(i, j) = atan(Gy / Gx);
        end
    end
end
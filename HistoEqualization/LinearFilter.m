function img_out = LinearFilter(img_in)

% Output image
img_out = uint8(zeros(size(img_in)));

% Setup variables for the kernel (the filter)
kernel = [1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];
kernel_width = size(kernel, 1);
kernel_height = size(kernel, 2);
pad_width = (size(kernel, 1) - 1);
pad_height = (size(kernel, 2) - 1);
pad_width_offset = floor(size(kernel, 1) / 2);
pad_height_offset = floor(size(kernel, 2) / 2);

% New matrix for the size of the image plus the size of the pad
img_padded = zeros((size(img_in, 1) + pad_width), ...
                   (size(img_in, 2) + pad_height));

% Iterable bounds of the padded image
img_pad_width = (size(img_padded, 1) - (size(kernel, 1) - 1));
img_pad_height = (size(img_padded, 2) - (size(kernel, 2) - 1));

% Copy the input pixels to the padded matrix
for i = 1:size(img_in, 1)
    for j = 1:size(img_in, 2)
        img_padded((i + pad_width_offset), (j + pad_height_offset)) ...
                    = img_in(i, j);
    end
end

% Iterate over the padded image
for i = 1:img_pad_width
    for j = 1:img_pad_height
        sum = 0;
        m = i;
        n = j;
        
        % Iterate over the kernel, applying the filter
        for k = 1:kernel_width
            for l = 1:kernel_height
                sum = (sum + (img_padded(m, n) * kernel(k, l)));
                n = n + 1;
            end
            n = j;
            m = m + 1;
        end
        
        % Set the output pixel to the value of the filtered pixel
        img_out(i, j) = sum;
    end
end

% Show the final output
figure, imshow(img_out);
title('Linear filter applied to image');

end
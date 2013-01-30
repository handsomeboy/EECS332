function img_out = HistoEqualization(img_in)

% Input image
img_in = rgb2gray(imread(img_in));
mat_width = size(img_in, 1);
mat_height = size(img_in, 2);
num_pixels = mat_width * mat_height;

% Output image
img_out = uint8(zeros(mat_width, mat_height));

% Matrices for probability calculations
pixel_count = zeros(256, 1);
pixel_prob = zeros(256, 1);

% Copy the input image into the frequency matrix, counting pixels
for i = 1:mat_width
    for j = 1:mat_height
        pixel = img_in(i, j);
        pixel_count(pixel + 1) = pixel_count(pixel + 1) + 1;
    end
end

% Calculate the frequency of each pixel
for i = 1:size(pixel_count, 1)
    pixel_prob(i) = (pixel_count(i) / num_pixels);
end

% Setup variables for the CDF function
prob_sum = 0;
num_bins = 255;
cumulative = zeros(256, 1);
cumulative_prob = zeros(256, 1);
pixel_adjusted = zeros(256, 1);

% Calculate the CDF for each pixel, and set the output pxel to this value
for i = 1:size(pixel_prob, 1)
    prob_sum = prob_sum + pixel_count(i);
    cumulative(i) = prob_sum;
    cumulative_prob(i) = (cumulative(i) / num_pixels);
    pixel_adjusted(i) = round(cumulative_prob(i) * num_bins);
end

% Copy the CDF-adjusted pixels into the output image
for i = 1:mat_width
    for j = 1:mat_height
        img_out(i, j) = pixel_adjusted(img_in(i, j) + 1);
    end
end

% Show the final output
figure, imshow(img_out);
title('Histogram equalization of original image');

end
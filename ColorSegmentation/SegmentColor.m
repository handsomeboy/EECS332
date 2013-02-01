function img_out = SegmentColor(img_in, threshold_values)

% Read in the image to be segmented
img_in = imread(img_in);
img_in_hsv = rgb2hsv(img_in);
[h, s] = rgb2hsv(img_in);

% A threshold value of 0.001 was found empirically to work the best
threshold = 0.001;

% Loop over the image in HSV color format
for i = 1:size(img_in_hsv, 1)
    for j = 1:size(img_in_hsv, 2)
        % Find the adjusted values for pixels in the input image
        adjusted_h = (round(h(i, j) * 100) + 1);
        adjusted_s = (round(s(i, j) * 100) + 1);
        % Blacken out pixels that aren't in the threshold
        if (threshold_values(adjusted_h, adjusted_s) < threshold)
            img_in(i, j, 1) = 0;
            img_in(i, j, 2) = 0;
            img_in(i, j, 3) = 0;
        end
    end
end

img_out = img_in;

% Show the final output
figure, imshow(img_out);
title('Image after color segmentation');
function img_out = TrainDetector()

% Read through each training image in the directory
images = dir(fullfile('/Users/josiah/Documents/School/College/Senior/332/EECS332/ColorSegmentation/','*.png'));

% Variables for histogram normalisation
sum = 0;
hspairs = zeros(101, 101);

% For each test file
for file = 1:length(images)
    % Process each test file
    img_in_path = images(file).name;
    img_in = imread(img_in_path);
    img_in_hsv = rgb2hsv(img_in);
    [h, s] = rgb2hsv(img_in);

    % For each pixel in the HSV color format image
    for i = 1:size(img_in_hsv, 1)
        for j = 1:size(img_in_hsv, 2)
            % Figure out the histogram bin value of each pixel
            adjusted_h = (round(h(i, j) * 100) + 1);
            adjusted_s = (round(s(i, j) * 100) + 1);
            
            % Set the bin value correspondingly in the histogram matrix
            hspairs(adjusted_h, adjusted_s) = hspairs(adjusted_h, adjusted_s) + 1;
            
            % Special case for white pixels
            if (~(adjusted_h == 1 && adjusted_s == 1))
                sum = sum + 1;
            end
        end
    end
end

% Calculate the normalised values in the histogram
for i = 1:size(hspairs, 1)
    for j = 1:size(hspairs, 2)
        hspairs(i, j) = hspairs(i, j) / sum;
    end
end

% Output the histogram
img_out = hspairs;
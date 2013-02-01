function crop(img_in)

% Read in the input image
img_in = imread(img_in);

% Open up the crop tool for the user
imcrop(img_in);
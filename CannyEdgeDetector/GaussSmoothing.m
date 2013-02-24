function S = GaussSmoothing(I, N, Sigma)
    
    % Setup an NxN matrix.
    x = -floor(N / 2):floor(N / 2);
    y = -floor(N / 2):floor(N / 2);
    [X, Y] = meshgrid(x, y);
    
    % Calculate the Gaussian distribution on the matrix.
    grid = exp(-((X .^ 2) + (Y .^ 2)) / (2 * (Sigma ^ 2)));
    
    % Weight the distribution with a corner value k.
    k = (1 / grid(N, N));
    kernel_nonnormal = (grid * k);
    
    % Normalize the distribution.
    kernel = (kernel_nonnormal / (sum(sum(kernel_nonnormal))));
    
    % Read in the input image into a double matrix.
    mat = im2double(rgb2gray(imread(I)));
    
    % Convolute the kernel with the original image.
    S = conv2(mat, kernel, 'same');
    
end
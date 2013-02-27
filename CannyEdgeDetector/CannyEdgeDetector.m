function Mag = CannyEdgeDetector(img_in, N, sigma, percentNonEdge)
    % Gaussian smoothing.
    S = GaussSmoothing(img_in, N, sigma);
    
    % Image gradient.
    [Mag, Theta] = ImageGradient(S);
    
    % Threshold values.
    [T_low, T_high] = FindThreshold(Mag, percentNonEdge);
    
    % Nonmaxima suppression.
    Mag = NonmaximaSuppress(Mag, Theta);
    
    % Edge linking.
    Mag = EdgeLinking(T_low, T_high, Mag);

    % Display final result.
    figure, imshow(Mag);
    title('Image after canny edge detection');
end
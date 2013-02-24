function Mag = CannyEdgeDetector(img_in, N, sigma, percentNonEdge)
   S = GaussSmoothing(img_in, N, sigma);
   [Mag, Theta] = ImageGradient(S);
   [T_low, T_high] = FindThreshold(Mag, percentNonEdge);
   Mag = NonmaximaSuppress(Mag, Theta);
   Mag = EdgeLinking(T_low, T_high, Mag);
   
   figure, imshow(Mag);
   title('Image after canny edge detection');
end
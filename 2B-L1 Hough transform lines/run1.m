% Hough Demo
% pkg load image;

img = imread('shapes.png');
grays = rgb2gray(img);
edges = edge(grays, 'canny');

% figure, imshow(img), title('Original image');
% figure, imshow(grays), title('Grayscale');
% figure, imshow(edges), title('Egde pixels');

% Apply Hough transform to find candidate lines
[accum theta rho] = hough(edges);
figure, imagesc(accum, 'XData', theta, 'YData', rho), title('Hough accumulator');

% Find peaks in th Hough accumulator matrix_type
peaks = houghpeaks(accum, 100);
hold on; plot(theta(peaks(:, 2)), rho(peaks(:, 1)), 'rs'); hold off;


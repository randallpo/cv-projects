%% ps1-8

img = imread(fullfile('input', 'ps1-input3.png'));
img_gray = rgb2gray(img);

filter_size = 5;
filter_sigma = 9;
filter = fspecial('gaussian', filter_size, filter_sigma);
img_smooth = imfilter(img_gray, filter, 'replicate');
edge_img_smooth = edge(img_smooth, 'Canny', 0.40);
[H, theta, rho] = hough_lines_acc(edge_img_smooth);
peaks = hough_peaks(H, 15);
peaks = filter_lines(peaks, rho, theta, 25, 5);
peaks = filter_parallel(peaks, rho, theta);

filter_size = 5;
filter_sigma = 9;
filter = fspecial('gaussian', filter_size, filter_sigma);
img_smooth = imfilter(img_gray, filter, 'replicate');
edge_img_smooth = edge(img_smooth, 'Canny', 0.36);
[centers, radii] = find_circles(edge_img_smooth, [25 50]);

hough_draw(img, 'ps1-8-a-1.png', peaks, rho, theta, centers, radii);
imshow(imread(fullfile('output', 'ps1-8-a-1.png')), 'InitialMagnification', 'fit');
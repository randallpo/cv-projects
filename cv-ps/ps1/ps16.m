%% ps1-6

img = imread(fullfile('input', 'ps1-input2.png'));
img_gray = rgb2gray(img);

filter_size = 5;
filter_sigma = 10;
filter = fspecial('gaussian', filter_size, filter_sigma);
img_smooth = imfilter(img_gray, filter, 'replicate');
edge_img_smooth = edge(img_smooth, 'Canny', 0.45);

[H, theta, rho] = hough_lines_acc(edge_img_smooth);
peaks = hough_peaks(H, 15);
peaks = filter_lines(peaks, rho, theta, 25, 5);
peaks = filter_parallel(peaks, rho, theta);
hough_lines_draw(img_gray, 'ps1-6-a-1.png', peaks, rho, theta);

imshow(imread(fullfile('output', 'ps1-6-a-1.png')), 'InitialMagnification', 'fit');

%% ps1-7

img = imread(fullfile('input', 'ps1-input2.png'));
img_gray = rgb2gray(img);

filter_size = 5;
filter_sigma = 9;
filter = fspecial('gaussian', filter_size, filter_sigma);
img_smooth = imfilter(img_gray, filter, 'replicate');
edge_img_smooth = edge(img_smooth, 'Canny', 0.36);

[centers, radii] = find_circles(edge_img_smooth, [25 50]);
hough_circles_draw(img, 'ps1-7-a-1.png', centers, radii);

imshow(imread(fullfile('output', 'ps1-7-a-1.png')), 'InitialMagnification', 'fit');
% Explore edge options
pkg load image;

% Read an image
img = imread('fall-leaves.png');
imshow(img);

% Create a guassian filter
filter_size = 21;
filter_sigma = 3;
filter = fspecial('gaussian', filter_size, filter_sigma);

% apply it, specifying and edge parameter
% smooth_img = imfilter(img, filter, 0);
% smooth_img = imfilter(img, filter, 'circular');
% smooth_img = imfilter(img, filter, 'replicate');
smooth_img = imfilter(img, filter, 'symmetric');
imshow(smooth_img);
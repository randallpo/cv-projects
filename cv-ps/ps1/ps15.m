%% ps1-5

% 1-c
img_smooth = imread(fullfile('output', 'ps1-4-a-1.png'));
imwrite(img_smooth, fullfile('output', 'ps1-5-a-1.png'));

edge_img_smooth = imread(fullfile('output', 'ps1-4-b-1.png'));
imwrite(edge_img_smooth, fullfile('output', 'ps1-5-a-2.png'));

[centers, radii] = find_circles(edge_img_smooth, [20 50]);

img_gray = rgb2gray(imread(fullfile('input', 'ps1-input1.png')));
hough_circles_draw(img_gray, 'ps1-5-a-3.png', centers, radii);

imshow(imread(fullfile('output', 'ps1-5-a-3.png')), 'InitialMagnification', 'fit');
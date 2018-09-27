% edge demo

% read lena image
lena = imread('lena.png');
% figure, imshow(lena), title('original image, color');

% convert to grayscale
lena_gray = rgb2gray(lena);
% figure, imshow(lena_gray), title('original image, grayscale');

% make a blur/smoothed version
h = fspecial('gaussian', [11 11], 4);
% figure, surf(h);

lena_smooth = imfilter(lena_gray, h);
% figure, imshow(lena_smooth), title('original image, smoothed');

% Method 1
lenaL = lena_smooth;
lenaL(:, [1:(end - 1)]) = lenaL(:, [2:end]);
lenaR = lena_smooth;
lenaR(:, [2:(end)]) = lenaR(:, [1:(end - 1)]);
lenaDiff= double(lenaR) - double(lenaL);
% figure, imshow(lenaDiff, []), title('Difference between right and left shift image');

% Method 2 Canny edge detector
canny_edge = edge(lena_gray,'canny');
% figure, imshow(canny_edge), title('Original [canny] edge');

canny_edge = edge(lena_smooth,'canny');
% figure, imshow(canny_edge), title('Smoothed [canny] edge');

% Method 3 Laplacian of gaussian
log_edge = edge(lena_gray,'log');
figure, imshow(log_edge), title('Original [log] edge');

log_edge = edge(lena_smooth,'log');
figure, imshow(log_edge), title('Smoothed [log] edge');


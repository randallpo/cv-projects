saturn = imread('saturn.png');

noise = randn(size(saturn)) .* 25;
img = saturn + noise;

subplot (1,2,1), imshow(saturn);
subplot (1,2,2), imshow(img);

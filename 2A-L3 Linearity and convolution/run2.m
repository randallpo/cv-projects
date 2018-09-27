pkg load image;

% Read an image
img = imread('moon.png');
imshow(img);
subplot(1,3,1),imshow(img);

% Add salt & pepper noise
noise_img = imnoise(img, 'salt & pepper', 0.02);
subplot(1,3,2), imshow(noise_img);

% Apply a median filter
median_img = medfilt2(noise_img);
subplot(1,3,3), imshow(median_img);


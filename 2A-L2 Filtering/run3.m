img = imread('saturn.png');
imshow(img);
subplot(1,3,1),imshow(img);

noise_sigma = 25;
noise = randn(size(img)) * noise_sigma;
noise_img = img + noise;
subplot(1,3,2),imshow(noise_img);

filter_size = 11;
filter_sigma = 2;

pkg load image;
filter = fspecial('gaussian',filter_size,filter_sigma);
smooth_img = imfilter(noise_img,filter);
subplot(1,3,3), imshow(smooth_img);
% Load and display an image
img = imread('fruit.png');
imshow(img);
disp(size(img));

img_red = img(:,:,1);
imshow(img_red);
disp(size(img_red));
plot(img_red(150,:));

pkg load image;
img = imread('bicycle.png');
hsize = 31;
sigma = 5;
h = fspecial('gaussian',hsize,sigma);
surf(h);
imagesc(h);
outim = imfilter(img, h);
imshow(outim);
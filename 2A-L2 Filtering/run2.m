pkg load image;
img = imread('bicycle.png');
hsize = 31;
for sigma=1:3:10
  h = fspecial('gaussian',hsize,sigma);
  surf(h);
  imagesc(h);
  outim = imfilter(img, h);
  imshow(outim);
 end
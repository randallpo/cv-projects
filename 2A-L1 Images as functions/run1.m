img = imread('peppers.png');
imshow(img);
line([1 512], [256 256], 'color', 'r');
plot(img(256,:));
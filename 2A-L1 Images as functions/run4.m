% Load and display an image
img = imread('bicycle.png');
imshow(img);
cropped = img(110:312, 10:160)
imshow(cropped);
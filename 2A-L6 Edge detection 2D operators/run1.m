% For Your Eyes Only
pkg load image;

frizzy = imread('frizzy.png');
froomer = imread('froomer.png');
imshow(frizzy); pause(2);
imshow(froomer); pause(2);

% TODO: Find edges in frizzy and froomer images
BW1 = edge(rgb2gray(frizzy),'Canny');
BW2 = edge(rgb2gray(froomer),'Canny');

% TODO: Display common edge pixels
imshow(BW1 & BW2);
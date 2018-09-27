% Test code:
dolphin = imread('dolphin.png');
bicycle = imread('bicycle.png');

diff = bicycle - dolphin;
abs_diff = abs(bicycle - dolphin);

imshow(diff);
imshow(abs_diff);

% Better: Use image package

pkg load image;
abs_diff2 = imabsdiff(dolphin, bicycle);

subplot(1,2,1), imshow(diff);
subplot(1,2,2),imshow(abs_diff2);

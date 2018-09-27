img = imread('peppers.png');
imshow(img);

sigma = 1.5;
noise = rand(size(img)) .* sigma;
output = img + noise;
imshow(output);
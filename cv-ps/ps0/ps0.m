% pkg load image
% Input images
image1 = imread('input/lena.jpg');
image2 = imread('input/woman.tiff');

[~, ~, chanel] = size(image2);
if chanel == 4
    image2(:,:,4) = [];
end
imwrite(image1, 'output/ps0-1-a-1.png');
imwrite(image2, 'output/ps0-1-a-2.png');

% Color planes
swap(:,:,1) = image1(:,:,3);
swap(:,:,2) = image1(:,:,2);
swap(:,:,3) = image1(:,:,1);

image1_green = image1(:,:,2);
image1_red = image1(:,:,1);
image1_blue = image1(:,:,3);
imwrite(swap, 'output/ps0-2-a-1.png');
imwrite(image1_green, 'output/ps0-2-b-1.png');
imwrite(image1_red, 'output/ps0-2-c-1.png');
imwrite(image1_green, 'output/ps0-2-d-1.png');

% Replacement of pixels
[y1, x1] = size(image1_green);
x_pos = ceil((x1 - 100) / 2);
y_pos = ceil((y1 - 100) / 2);
image1_green_center = image1_green(y_pos:y_pos+99, x_pos:x_pos+99);

image2_gray = rgb2gray(image2);
[y2, x2] = size(image2_gray);
x_pos = ceil((x2 - 100) / 2);
y_pos = ceil((y2 - 100) / 2);
image2_gray(y_pos:y_pos+99, x_pos:x_pos+99) = image1_green_center;
imwrite(image2_gray, 'output/ps0-3-a-1.png');

% Arithmetic and Geometric operations
max_value = max(max(image1_green,[],1), [], 2);
min_value = min(min(image1_green,[],1), [], 2);
mean_value = mean(mean(image1_green,1), 2);
std_value = std( std(double(image1_green),1,1), 1, 2);
disp("The maximum is "), disp(max_value);
disp("The minimum is "), disp(min_value);
disp("The mean is "), disp(mean_value);
disp("The standard deviation is "), disp(std_value);

image1_green_norm = image1_green;
image1_green_norm = image1_green_norm - mean_value;
image1_green_norm = image1_green_norm / std_value;
image1_green_norm = image1_green_norm * 10;
image1_green_norm = image1_green_norm + mean_value;
imwrite(image1_green_norm, 'output/ps0-4-b-1.png');

image1_green_shift = [image1_green(:, 3:x1) zeros(y1, 2)];
image1_green_sub = image1_green - image1_green_shift;
imwrite(image1_green_shift, 'output/ps0-4-c-1.png');
imwrite(image1_green_sub, 'output/ps0-4-d-1.png');

% Noise
image1_green_temp = image1;
image1_blue_temp = image1;
noise_sigma = 25;
noise = uint8(randn(size(image1_green)) * noise_sigma);

image1_green_noise = image1_green + noise;
image1_green_temp(:, :, 2) = image1_green_noise;

image1_blue_noise = image1_blue + noise;
image1_blue_temp(:, :, 3) = image1_blue_noise;

imwrite(image1_green_temp, 'output/ps0-5-a-1.png');
imwrite(image1_blue_temp, 'output/ps0-5-b-1.png');
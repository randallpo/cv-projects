% ps1-3

noise_img = imread(fullfile('input', 'ps1-input0-noise.png'));

filter_size = 23;
filter_sigma = 4;
filter = fspecial('gaussian', filter_size, filter_sigma);
smooth_img = imfilter(noise_img, filter);
imwrite(smooth_img, fullfile('output', 'ps1-3-a-1.png'));

edge_noise_img = edge(noise_img, 'canny');
imwrite(edge_noise_img, fullfile('output', 'ps1-3-b-1.png'));
edge_smooth_img = edge(smooth_img, 'canny');
imwrite(edge_smooth_img, fullfile('output', 'ps1-3-b-2.png'));

[H, theta, rho] = hough_lines_acc(edge_smooth_img);
peaks = hough_peaks(H, 10);
annotate_peaks(H, peaks, 'ps1-3-c-1.png');
hough_lines_draw(noise_img, 'ps1-3-c-2.png', peaks, rho, theta);
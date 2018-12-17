%% ps1-4

% img = imread(fullfile('input', 'ps1-input1.png'));
% img_gray = rgb2gray(img);
% 
% filter_size = 20;
% filter_sigma = 3;
% filter = fspecial('gaussian', filter_size, filter_sigma);
% img_smooth = imfilter(img_gray, filter, 'replicate');
% imwrite(img_smooth, fullfile('output', 'ps1-4-a-1.png'));
% 
% edge_img_smooth = edge(img_smooth, 'Canny', 0.3);
% imwrite(edge_img_smooth, fullfile('output', 'ps1-4-b-1.png'));
% 
% [H, theta, rho] = hough_lines_acc(edge_img_smooth);
% peaks = hough_peaks(H, 10);
% annotate_peaks(H, peaks, 'ps1-4-c-1.png');
% hough_lines_draw(img_gray, 'ps1-4-c-2.png', peaks, rho, theta);
% 
% imshow(imread(fullfile('output', 'ps1-5-a-3.png')), 'InitialMagnification', 'fit');

img = imread(fullfile('input', 'ps1-input1.png'));
img_gray = rgb2gray(img);
filter_size = 11;
filter_sigma = 2;
filter = fspecial('gaussian', filter_size, filter_sigma);
img_smooth = imfilter(img_gray, filter);
edge_img_smooth = edge(img_smooth, 'Canny',0.66);
[H, theta, rho] = hough(edge_img_smooth);
peaks = houghpeaks(H, 10);
lines = houghlines(edge_img_smooth, theta, rho, peaks);
imshow(img_gray), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
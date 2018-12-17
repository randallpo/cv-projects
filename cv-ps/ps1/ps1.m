% ps1-2

img = imread(fullfile('input', 'ps1-input0.png'));  % already grayscale
%% TODO: Compute edge image img_edges
img_edges = edge(img, 'Canny');
imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png

%% 2-a
[H, theta, rho] = hough_lines_acc(img_edges);  % defined in hough_lines_acc.m
%% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png
annotate_peaks(H, [], 'ps1-2-a-1.png');

%% 2-b
peaks = hough_peaks(H, 10);  % defined in hough_peaks.m
%% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png
annotate_peaks(H, peaks, 'ps1-2-b-1.png');

%% TODO: Rest of your code here
hough_lines_draw(img, 'ps1-2-c-1.png', peaks, rho, theta);
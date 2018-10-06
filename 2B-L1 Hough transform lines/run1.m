% Hough Demo
% pkg load image;

img = imread('shapes.png');
grays = rgb2gray(img);
edges = edge(grays, 'canny');

% figure, imshow(img), title('Original image');
% figure, imshow(grays), title('Grayscale');
% figure, imshow(edges), title('Egde pixels');

% Apply Hough transform to find candidate lines
[accum, theta, rho] = hough(edges);
figure, imagesc(accum, 'XData', theta, 'YData', rho), title('Hough accumulator');

% Find peaks in th Hough accumulator matrix_type
peaks = houghpeaks(accum, 100);
hold on; plot(theta(peaks(:, 2)), rho(peaks(:, 1)), 'rs'); hold off;

line_seq = houghlines(edges, theta, rho, peaks);
figure, imshow(img), title('Line seqment');
hold on;
for k=1:length(line_seq)
  endpoint = [line_seq(k).point1; line_seq(k).point2];
  plot(endpoint(:, 1), endpoint(:, 2), 'LineWidth', 2, 'Color', 'green');
end
hold off;

% Alt more precise lines
peaks = houghpeaks(accum, 100, 'Threshold', ceil(0.6 * max(accum(:))), 'NHoodSize', [5 5]);
figure, imagesc(theta, rho, accum), title('Hough accumulator');
hold on;
plot(theta(peaks(:, 2)), rho(peaks(:, 1)), 'rs');
hold off;

line_seq = houghlines(edges, theta, rho, peaks, 'FillGap', 50, 'MinLength', 100); 
figure, imshow(img), title('Line seqment');
hold on;
for k=1:length(line_seq)
  endpoint = [line_seq(k).point1; line_seq(k).point2];
  plot(endpoint(:, 1), endpoint(:, 2), 'LineWidth', 2, 'Color', 'green');
end
hold off;

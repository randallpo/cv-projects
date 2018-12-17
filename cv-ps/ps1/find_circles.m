function [centers, radii] = find_circles(BW, radius_range)
    % Find circles in given radius range using Hough transform.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius_range: Range of circle radii [min max] to look for, in pixels

    % TODO: Your code here
    start = radius_range(1);
    stop = radius_range(2);
    step = 4;
    centers = zeros(0, 2);
    radii = zeros(0,1);
    for r = start:step:stop
        H = hough_circles_acc(BW, r);
        temp_centers = hough_peaks(H, 10, 'Threshold', 128);
        centers = [centers; temp_centers];
        temp_r = zeros(0,1);
        temp_r(1:size(temp_centers,1)) = r;
        radii = [radii; temp_r];
    end
end

function H = hough_circles_acc(BW, radius)
    % Compute Hough accumulator array for finding circles.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius: Radius of circles to look for, in pixels

    % TODO: Your code here
    [rows, cols] = size(BW);
    H = zeros(rows, cols);
    for y = 1:rows
      for x = 1:cols
        if (BW(y, x))
            for theta = 0:360
                a = x + round(radius * cosd(theta));
                b = y + round(radius * sind(theta));
                if (a > 0 && a <= cols) && (b > 0 && b <= rows)
                    H(b, a) = H(b, a) + 1;
                end
            end
        end
      end
    end
end

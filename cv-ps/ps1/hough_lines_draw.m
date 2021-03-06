function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees

    % TODO: Your code here
    f = figure(1);
    set(f, 'visible', 'off');
    imshow(img);
    hold on;
    %plot stuff
    [peaks_len, ~] = size(peaks);
    for i = 1:peaks_len
        idx = peaks(i, :);
        r = rho(idx(1));
        t = theta(idx(2));
        x0 = r * cosd(t);
        y0 = r * sind(t);
        x1 = x0 - 1000 * sind(t);
        y1 = y0 + 1000 * cosd(t);
        x2 = x0 + 1000 * sind(t);
        y2 = y0 - 1000 * cosd(t);
        line([x1, x2], [y1, y2], 'Color', 'green', 'LineWidth', 2); 
    end
    saveas(f, strcat('output/', outfile), 'png');
    hold off;
    close(f);
end

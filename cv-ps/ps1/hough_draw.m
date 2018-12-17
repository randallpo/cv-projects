function hough_draw(img, outfile, peaks, rho, theta, centers, radii)
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
    
    %plot stuff
    for i = 1 : size(centers, 1)
        x0 = centers(i, 2);
        y0 = centers(i, 1);
        theta = linspace(0, 2 * pi, 360);
        x = x0 + round(radii(i) * cos(theta));
        y = y0 + round(radii(i) * sin(theta));
        plot(x, y, 'g', 'LineWidth', 2);
    end
    saveas(f, strcat('output/', outfile), 'png');
    hold off;
    close(f);
end
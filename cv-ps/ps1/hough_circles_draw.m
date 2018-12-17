function hough_circles_draw(img, outfile, centers, radii)
    f = figure(1);
    set(f, 'visible', 'off');
    imshow(img);
    hold on;
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
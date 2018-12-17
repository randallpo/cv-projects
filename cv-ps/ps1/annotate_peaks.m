function [ ] = annotate_peaks( H, peaks, outfile )
    % imshow(im2uint8(mat2gray(H)));
    imshow(imadjust(mat2gray(H)));
    g = figure(1);
    set(g, 'visible', 'off');
    hold on;
    for idx = 1:size(peaks,1)
        rectangle('Position', [fliplr(peaks(idx,:))-[2 2],4, 4], 'EdgeColor', 'white', 'LineWidth', 3);
    end
    i = getframe(gca);
    [X, ~] = frame2im(i);
    f=figure(2);
    set(f, 'visible', 'off');
    imshow(X);
    saveas(f, strcat('output/', outfile), 'png');
    hold off;
    close(g);
    close(f);    
end
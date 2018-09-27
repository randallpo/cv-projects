pkg load image; % AFTER function definition

% Test code:
tablet = imread('tablet.png');
imshow(tablet);
glyph = tablet(75:165, 150:185);
imshow(glyph);

[y x] = find_template_2D(glyph, tablet);
disp([y x]); % should be the top-left corner of template in tablet

colormap('gray'), imagesc(tablet);
hold on;
%plot(x, y, 'r+', 'markersize', 16);
rectangle('Position',[x, y, 35, 90],'FaceColor',[0 .5 .5],'EdgeColor','b','LineWidth',3)
hold off;
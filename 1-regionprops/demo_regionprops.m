% demo
bw = imread('text.png');
L = bwlabel(bw);

s = regionprops(L, {'boundingbox', 'area'});
bbox = cat(1, s.BoundingBox);
area = cat(1, s.Area);

% bbox: [ul_corner width]
% bbox: [x y W H] <-- RECT
imshow(bw);
hold on;
plot(bbox(:,1), bbox(:,2), 'r*');
hold off;
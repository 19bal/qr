close all;  clear all;  clc;

%%%%%%%%%%%%%%%% D O   N O T   E D I T   M E %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LIB_PATH = sprintf('..%slib%s', filesep,filesep);                         %
addpath(LIB_PATH,'-end');                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dbg = true;

% DIPimage i yukle!
dip_initialise('silent');

dbnm = pathos('../../db/stanford/');
DIR = dir(strcat(dbnm, '*.jpg'));

img = imread(strcat(dbnm, DIR(4).name));

h = fspecial('average', 3);
img = imfilter(img, h, 'replicate');

img = imadjustRGB(img);

img1 = uint8(mean(double(img), 3));
img2 = uint8(max(double(img),  [], 3));

T = 1;
fark = double(img2) - double(img1);
bw = (fark < T);

bw2 = bwareaopen(bw, 15);

if dbg
    figure(1),  
    subplot(221),   imshow(img);
    subplot(222),   imshow(img1);
    subplot(223),   imshow(bw);
    subplot(224),   imshow(bw2);
end
    
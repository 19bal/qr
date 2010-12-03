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

bw = boolean(1 - pre_proccess_2(img, 50, 0.05, 0, false));


% % % % % DIPIMAGE !!!!!!!!!!!!
a = dip_image(bw);

b = berosion(a,3,-1,1);
%...

bw2 = boolean(b);

L = bwlabel(bw2);
s = regionprops(L, {'majoraxislength', 'minoraxislength', 'area'});
majorAL = cat(1, s.MajorAxisLength);
minorAL = cat(1, s.MinorAxisLength);

areas = cat(1, s.Area);

alan = majorAL .* minorAL;
fark = alan ./ areas;
%se = strel('line',11,90);
%dilatedBW = imdilate(bw,se);

if dbg
    figure(1)
    subplot(121),   imshow(img)
    subplot(122),   imshow(bw2)
end
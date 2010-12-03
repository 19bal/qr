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

bw = pre_proccess_2(img, 50, 0.05, 0, false);

if dbg
    figure(1)
    subplot(211),   imshow(img)
    subplot(212),   imshow(bw)
end
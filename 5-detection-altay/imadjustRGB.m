function J = imadjustRGB(I)
% function J = imadjustRGB(I)

for i=1:3
    x = I(:,:,i);
    y = imadjust(x);
    J(:,:,i) = y;
end
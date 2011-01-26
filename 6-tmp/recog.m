addpath('../training_images/')

IM=imread('training_3.jpg');
IM=mat2gray(IM);
mIM=imfilter(IM,fspecial('average',7),'replicate');
sIM=mIM-IM-0.033;
bw=im2bw(sIM,0);
bw=imcomplement(bw);
t = strel('disk',2);
bw = imopen(bw,t);
bw = imclose(bw,t);
img=edge(double(bw),'canny');
t3= imfill(img,'holes');
t3 = bwareaopen(t3, 50);
L = bwlabel(t3);
rgb=label2rgb(L);
s = regionprops(L, rgb2gray(IM), {'orientation', 'BoundingBox', 'centroid', 'Area', 'MajorAxisLength', 'MinorAxisLength'});
orientation = cat(1, s.Orientation);
centroid = cat(1, s.Centroid);
bbox = cat(1, s.BoundingBox);
area = cat(1,s.Area);
major = cat(1,s.MajorAxisLength);
minor = cat(1,s.MinorAxisLength);
thrsh_top=400;
thrsh_bottom=140;
figure,imshow(L)
hold on
[count,a] = size(area);
for k = 1 : count
 ar = area(k,1);
 if ar > thrsh_bottom 
     if ar < thrsh_top
     plot(s(k).Centroid(1),s(k).Centroid(2), 'b*');
     end
 end
end
hold off
[t,x]=size(centroid);
figure, imshow(L)
hold on
    for n = 1 : t  
    for m = 1 : t             
       a = centroid(n,1);%x1
       c = centroid(n,2);%y1
       b = centroid(m,1);%x2
       d = centroid(m,2);%y2
       dist = sqrt((b-a)^2+(d-c)^2);
    if dist > 35 
        if dist < 42            
           plot(s(n).Centroid(1),s(n).Centroid(2), 'k*');
           plot(s(m).Centroid(1),s(m).Centroid(2), 'g*');
           break
        end
    end  
    end
    end
hold off
[z,q] = size(orientation);
figure, imshow(L)
hold on
for j= 1 : z
 for p= 1 : z  
     w = orientation(j,1);
     f = orientation(p,1);
     ort = abs(abs(w - f)- 90);
     if ort > 0
         if ort < 2.5
           plot(s(j).Centroid(1),s(j).Centroid(2), 'y*');
           plot(s(p).Centroid(1),s(p).Centroid(2), 'c*'); 
            break 
         end
    end
 end
end
hold off
[r,h] = size(bbox);
figure, imshow(L)
hold on
for x = 1 : r
  rectangle('Position', s(x).BoundingBox, ...
        'EdgeColor','g');  
end
hold off
[i,l] = size(bbox);
figure, imshow(L)
hold on
for v = 1 : i   
   bbox_area = bbox(v,3)*bbox(v,4);
   ar_ea = area(v,1);
   rate = bbox_area/ar_ea;
   if rate > 1
       if rate < 3
           plot(s(v).Centroid(1),s(v).Centroid(2), 'b*');
       end
   end
end
hold off
[u,o] = size(major);
figure, imshow(L)
hold on
for m = 1 : u   
   vert = major(m,1);
   horz = minor(m,1);
   rate = vert/horz;
   if rate > 3
       if rate < 9
           plot(s(m).Centroid(1),s(m).Centroid(2), 'g*');
       end
   end
end
hold off
%for i=1:max(L(:)), close; figure(88), imshow(ismember(L, i)), pause, end
%rectangle('Position', s(lowStd(k)).BoundingBox, ...
       % 'EdgeColor','y');
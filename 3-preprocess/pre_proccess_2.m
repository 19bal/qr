function bw=pre_proccess_2(IM,ws,C,tm,dbg)
%PRE_PROCCESS adaptive threshold algoritmas? kullan?larak haz?rlanm?? bir imaj ?ni?leme fonksiyonudur.
%
%bw=pre_proccess(I,ws,C)mean-C veya median-C local threshold kullanarak bir binary imaj ?retir.
%ws lokal pencere boyutudur.
%tm =0 veya 1 olmas? mean ile median aras?nda ge?i?i sa?lar. tm=0 mean(default),tm=1 median dir. 
%
%?rnek Kullan?m?;
%pre_proccess('training_4.jpg',14,0.03);
%
%Bu fonksiyon Ahmet D?NER taraf?ndan ?retilmi?tir. Ondokuz May?s ?niversitesi,SAMSUN 2010
%

if (nargin<3)
    error('Bir I imaji,ws pencere boyutu,ve C girmelisiniz.');
elseif (nargin==3)
    tm=0;
elseif (tm~=0 && tm~=1)
    error('tm 0 veya 1 olmali.');
end

IM=mat2gray(IM);

if tm==0
    mIM=imfilter(IM,fspecial('average',ws),'replicate');
else
    mIM=medfilt2(IM,[ws ws]);
end
sIM=mIM-IM-C;
bw=im2bw(sIM,0);
bw=imcomplement(bw);
t = strel('disk',1);
bw = imopen(bw,t);
bw = imclose(bw,t);

if dbg
    figure(11)
    subplot(1,2,1),imshow(IM);
    subplot(1,2,2),imshow(bw);
end

function bw=pre_proccess_2(I,ws,C,tm)
%PRE_PROCCESS adaptive threshold algoritmasý kullanýlarak hazýrlanmýþ bir imaj öniþleme fonksiyonudur.
%
%bw=pre_proccess(I,ws,C)mean-C veya median-C local threshold kullanarak bir binary imaj üretir.
%ws lokal pencere boyutudur.
%tm =0 veya 1 olmasý mean ile median arasýnda geçiþi saðlar. tm=0 mean(default),tm=1 median dir. 
%
%Örnek Kullanýmý;
%pre_proccess('training_4.jpg',14,0.03);
%
%Bu fonksiyon Ahmet DÖNER tarafýndan üretilmiþtir. Ondokuz Mayýs Üniversitesi,SAMSUN 2010
%
IM=imread(I);
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
subplot(1,2,1),imshow(IM);
subplot(1,2,2),imshow(bw);
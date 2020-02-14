%Exercise A.1
clearvars;
close all;
clc;

l1=imread('lena1.bmp');
l2=imread('lena2.bmp');
l3=imread('lena3.bmp');
l4=imread('lena4.bmp');

figure(1);
subplot(4,2,1);
imshow(l1);
subplot(4,2,2);
imhist(l1,256);

subplot(4,2,3);
imshow(l2);
subplot(4,2,4);
imhist(l2,256);

subplot(4,2,5);
imshow(l3);
subplot(4,2,6);
imhist(l3,256);

subplot(4,2,7);
imshow(l4);
subplot(4,2,8);
imhist(l4,256);

%Exercise A.3
h1 = imread('hist1.bmp');
figure(2);
subplot(2,1,1);
imshow(h1);
subplot(2,1,2);
imhist(h1,256);

%Exercise A.4
h2 = imadjust(h1);
figure(3);
subplot(2,1,1);
imshow(h2);
subplot(2,1,2);
imhist(h2,256);

%Exercise A.8 and A.9
[H, x, C2] = cumulatedHist(h2);
figure(4);
subplot(2,1,1);
imshow(h2);
subplot(2,1,2);
plot(x,H);
hold on;
plot(x, C2);
title('Cumulated Histogram');

%Exercise A.10 i A.11

figure(5);
lut = uint8(255*(C2/max(C2)));
[Hlut, xlut, Clut] = cumulatedLut(h1, lut); 

subplot(4, 1, 1);
imshow(intlut(h1, lut));
title('LUT converted');

subplot(4,1,3);
histeq(h1, 256);
title('histeq treated');

subplot(4,1,2); 
plot(xlut, Hlut);
title('histogram');

subplot(4,1,4); 
plot(xlut, Clut);
title('cumulated histogram');



%Exercise A.13 i A.14

h2 = imread('hist2.bmp');
h3 = imread('hist3.bmp');
h4 = imread('hist4.bmp');

% h2 image
figure(6);
subplot(3,4,1); 
imshow(h2); 
title('no changes');
subplot(3,4,2); 
imshow(imadjust(h2)); 
title('adjusted');
subplot(3,4,3); 
imshow(histeq(h2)); 
title('histeq ');
subplot(3,4,4); 
imshow(adapthisteq(h2)); 
title('adapthisteq');

% hist3 image
subplot(3,4,5); 
imshow(h3); 
subplot(3,4,6); 
imshow(imadjust(h3)); 
subplot(3,4,7); 
imshow(histeq(h3)); 
subplot(3,4,8); 
imshow(adapthisteq(h3)); 

% hist4 image
subplot(3,4,9); 
imshow(h4);
subplot(3,4,10); 
imshow(imadjust(h4)); 
subplot(3,4,11); 
imshow(histeq(h4)); 
subplot(3,4,12); 
imshow(adapthisteq(h4));





function [H, x, C] = cumulatedHist(hist)
[H, x] = imhist(hist);
tmpC = cumsum(H);
k = max(tmpC)/max(H);
C = tmpC/k;
end

function [Hlut, xlut, Clut] = cumulatedLut(h1, lut)
[Hlut, xlut] = imhist(intlut(h1, lut),256);
tmpC = cumsum(Hlut);
k = max(tmpC) / max(Hlut);
Clut = tmpC / k; 
end




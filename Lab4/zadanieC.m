clearvars;
close all;
clc;

% Exercise C.1 

% Reading images
lena = imread('lenaRGB.bmp');
jezioro = imread('jezioro.jpg');

image = lena;

figure(1);
imshow(image);

% extracting rgb
red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);

figure(2);
subplot(3,1,1);
imhist(red, 256);
title('red');

subplot(3,1,2);
imhist(green, 256);
title('green');

subplot(3,1,3);
imhist(blue, 256);
title('blue');

% Exercise C.2
obrazEQ = image;
% red
obrazEQ(:,:,1) = histeq(red, 256);
% green 
obrazEQ(:,:,2) = histeq(green, 256);
% blue 
obrazEQ(:,:,3) = histeq(blue, 256);

figure(3);
imshow(obrazEQ);

% Exercise C.3
hsv = rgb2hsv(image);

h = hsv(:,:,1);
s = hsv(:,:,2);
v = hsv(:,:,3);

figure(4);
subplot(3,1,1);
imhist(h, 256);
title('h');

subplot(3,1,2);
imhist(s, 256);
title('s');

subplot(3,1,3);
imhist(v, 256);
title('v');

% manipulating h
hsv(:,:,3) = histeq(v, 256);
hsv = hsv2rgb(hsv);

figure(5);
subplot(2,1,1);
imshow(hsv);
title('changed');
subplot(2,1,2);
imshow(image);
title('normal');
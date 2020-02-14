% Mikolaj Ogarek 

% Zadanie 1
clear;
clc;
close all;

moon = imread('moon.bmp');

% Zadanie 2 i 3
M = [ 0 1 0; 1 -4 1; 0 1 0] / 9;

% Zadanie 4
laplacianFilter = fspecial('laplacian');
convoluted = uint8(conv2(moon, laplacianFilter, 'same'));

% Zadanie 5 i 6 
figure;
subplot(2,2,1);
imshow(convoluted + 128,[]);
title('Laplacian with +128');

subplot(2,2,2);
imshow(abs(convoluted),[]);
title('Laplacian with abs() ');

subplot(2,2,3);
imshow(moon + convoluted + 128,[]);
title('Moon with +128');

subplot(2,2,4);
imshow(moon + abs(convoluted),[]);
title('Moon with abs()');

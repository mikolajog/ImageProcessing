clearvars;
close all;
clc;

%Exercise B2

% Image reading
phobos = imread('phobos.bmp');

I = phobos;

load('histogramZadany');

% show histogramZadany
figure(1);
plot(histogramZadany);

% adjusting image 
I2 = histeq(I, histogramZadany);

figure(2);
subplot(3,1,1);
imshow(I2);
title('histeq');

subplot(3,1,2);
imhist(I, 256);
title('histogram');

subplot(3,1,3);
aI = imadjust(I2);
adapt = adapthisteq(aI, 'clipLimit', 0.02, 'Distribution', 'rayleigh');
imshow(adapt);
title('imadjust and adapthisteq');
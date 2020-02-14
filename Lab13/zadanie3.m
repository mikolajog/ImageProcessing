% Mikołaj Ogarek

%przygotowanie
clear;
clc;
close all;

%wczytanie
image = imread('lunar.bmp');

%wyświetl
fourier = fft2(image);
shifted = fftshift(fourier);
amplitude = log10(abs(shifted)+1);

phase = angle(shifted.*(amplitude>0.0001));

figure;
subplot(1,3,1);
imshow(image);
title('original');
subplot(1,3,2);
imshow(amplitude, []);
title('A');
subplot(1,3,3)
imshow(phase, []);
title('phase');

%korekcja
th = 10;
shifted(amplitude >= th) = 0;

%odwracanie
unshifted = ifftshift(shifted);
unfourier = ifft2(unshifted);

figure;
subplot(1,2,1);
imshow(image);
title('original');
subplot(1,2,2);
imshow(uint8(unfourier));
title('undone');


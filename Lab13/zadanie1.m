%Mikołaj Ogarek
%Fourier
close all;
clearvars;
clc;

%wczytanie obrazów

dwiefale = imread('dwieFale.bmp');
kolo = imread('kolo.bmp');
kwadrat = imread('kwadrat.bmp');
kwadrat45 = imread('kwadrat45.bmp');
trojkat = imread('trojkat.bmp');

fourierF(dwiefale);
fourierF(kolo);
fourierF(kwadrat);
fourierF(kwadrat45);
fourierF(trojkat); 



function fourierF(image)
%transformacja
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

%odwrót
unshifted = ifftshift(shifted);
unfourier = ifft2(unshifted);

figure;
subplot(1,2,1);
imshow(image);
title('original');
subplot(1,2,2);
imshow(unfourier);
title('reverted');

end
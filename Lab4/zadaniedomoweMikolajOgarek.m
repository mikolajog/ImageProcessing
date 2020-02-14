%Mikołaj Ogarek
%Zadanie domowe lab4


%% Metoda BBHE

%Exercise 1
clearvars;
close all;
clc;

jet = imread('jet.bmp');

%Exercise 2
lm = round(mean(jet(:)));

%Exercise 3 divide on 2 histograms
[H, x] = imhist(jet);
H1 = H(1:lm);
H2 = H(lm: 255);

%Exercise 3 normalize
H1 = H1/sum(H1);
H2 = H2/sum(H2);

%Exercise 3 histograms cumulated
C = cumsum(H1);
k = max(C)/max(H1);
C1 = C/k;

C = cumsum(H2);
k = max(C)/max(H2);
C2 = C/k;

%Exercise 4
C1n = lm* C1;
C2n = lm+1 + (255-lm+1)*C2;

%must be changed as error "validateattributes(lut, {'uint8',
%'uint16','int16'}, ..."
C1n = uint8(C1n);
C2n = uint8(C2n);

lut = [C1n; C2n];

%Exercise 5
result = intlut(jet, lut);

figure(1);
subplot(2,1,1);
imhist(result, 256);
title('BBHE');
subplot(2,1,2);
imshow(result);


%% Metoda DSIHE
%Exercise 1
clearvars;
clc;
jet = imread('jet.bmp');

%Exercise 2
lm = round(mean(jet(:)));

[H, x] = imhist(jet);
C = cumsum(H);
[X Y] = size(jet);
[value lm] = min(abs(C-(X*Y/2)));
lm = round(lm);


%Exercise 3 divide on 2 histograms
H1 = H(1:lm);
H2 = H(lm: 255);

%Exercise 3 normalize
H1 = H1/sum(H1);
H2 = H2/sum(H2);

%Exercise 3 histograms cumulated
C = cumsum(H1);
k = max(C)/max(H1);
C1 = C/k;

C = cumsum(H2);
k = max(C)/max(H2);
C2 = C/k;

%Exercise 4
C1n = lm* C1;
C2n = lm+1 + (255-lm+1)*C2;

%must be changed as error "validateattributes(lut, {'uint8',
%'uint16','int16'}, ..."
C1n = uint8(C1n);
C2n = uint8(C2n);

lut = [C1n; C2n];

%Exercise 5
result = intlut(jet, lut);

figure(2);

subplot(2,1,1);
imhist(result, 256);
title('DSIHE');
subplot(2,1,2);
imshow(result);




%Mikołaj Ogarek
%JPEG

close all; 
clearvars; 
clc;


load('tablice_kwantyzacji.mat')

lilia = imread('mglawica_kolor.png');
imshow(lilia);


%% Encoding

%blkproc(A,[m n],fun) processes the image A by applying the function fun 
%to each distinct m-by-n block of A, padding A with 0's if necessary. 
%fun is a function handle that accepts an m-by-n matrix, x, and returns a matrix, 
%vector, or scalar y

%1
liliaYUV = rgb2ycbcr(lilia);

%4
Fdct2(:,:,1) = blkproc(liliaYUV(:,:,1), [8 8], @dct2);
Fdct2(:,:,2) = blkproc(liliaYUV(:,:,2), [8 8], @dct2);
Fdct2(:,:,3) = blkproc(liliaYUV(:,:,3), [8 8], @dct2);

%5
c = 4;

Z(:,:,1) = blkproc(Fdct2(:,:,1), [8 8], (@(x) round(x ./ (c*Qy))));
Z(:,:,2) = blkproc(Fdct2(:,:,2), [8 8], (@(x) round(x ./ (c*Qc))));
Z(:,:,3) = blkproc(Fdct2(:,:,3), [8 8], (@(x) round(x ./ (c*Qc))));

%% Decoding

%4
Fidct2(:,:,1) = blkproc(Z(:,:,1), [8 8], (@(x) x .* (c*Qy)));
Fidct2(:,:,2) = blkproc(Z(:,:,2), [8 8], (@(x) x .* (c*Qc)));
Fidct2(:,:,3) = blkproc(Z(:,:,3), [8 8], (@(x) x .* (c*Qc)));

%5 i 6
decImgYUV(:,:,1) = blkproc(Fidct2(:,:,1), [8 8], @idct2);
decImgYUV(:,:,2) = blkproc(Fidct2(:,:,2), [8 8], @idct2);
decImgYUV(:,:,3) = blkproc(Fidct2(:,:,3), [8 8], @idct2);

%7
decImgRgb = ycbcr2rgb(uint8(decImgYUV));
figure;
imshow(decImgRgb);


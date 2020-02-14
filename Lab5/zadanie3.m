% Binaryzacja dwuprogowa

clearvars;
close all;
clc;

bart = imread('bart.bmp');

bartB = bart > 175 & bart < 210;

%too many input arguments error
% bartB = uint8(bartB,[]); 

figure;
subplot(3,1,1);
imshow(bart);
title('original');
subplot(3,1,2);
imhist(bart);
title('histogram');
subplot(3,1,3);
imshow(bartB);
title('binarized');
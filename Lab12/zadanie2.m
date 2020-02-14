%Mikołaj Ogarek

clearvars;
clc;
close all;

I = imread('ccl2.png');
A = bwlabel(I,4);
B = bwlabel(I,8);

subplot(1,3,1);
imshow(I,[]);

subplot(1,3,2);
imshow(A,[]);

subplot(1,3,3);
imshow(B,[]);
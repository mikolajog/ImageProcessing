clearvars;
close all;
clc;

%Exercise 2.3.1 and 2.3.2

lena = imread('lena.bmp');
figure(1);
imshow(lena)


%% 256x256

pic1 = imresize(lena, 0.5);
figure(2);
imshow(pic1,'InitialMagnification', 200)

%% 128x128

pic2 = imresize(lena, 0.25);
figure(3);
imshow(pic2,'InitialMagnification', 400)

%% 64x64

pic3 = imresize(lena, 0.125);
figure(4);
imshow(pic3,'InitialMagnification', 800)
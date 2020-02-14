%Exercise 2.4.1 and 2.4.2

clearvars;
close all;
clc;

I = imread('lena.bmp');
figure(1);
imshow(I)

subplot(2,3,1)
I1 = imresize(I, 0.25, 'nearest');

imshow(I1,[])

subplot(2,3,2)
o1 = imadjust(I, [0.0 31/255]);
imshow(o1,[])

subplot(2,3,3)
o1 = imadjust(I, [0.0 15/255]);
imshow(o1,[])

subplot(2,3,4)
o1 = imadjust(I, [0.0 7/255]);
imshow(o1,[])

subplot(2,3,5)
o1 = imadjust(I, [0.0 3/255]);
imshow(o1,[])

subplot(2,3,6)
o1 = imadjust(I, [0.0 1/255]);
imshow(o1,[])
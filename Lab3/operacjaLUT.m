clearvars;
close all;
clc;

%Exercise 3
load funkcjeLUT;

%Exercise 4
figure(1);
plot(kwadratowa);

%Exercise 5
I = imread('lena.bmp');
figure(2);
imshow(I)

%Exercise 6
B = intlut(I,kwadratowa);
figure(3);
imshow(B)

%Exercise 8
figure(4);
LUT(I, kwadratowa);

figure(5);
LUT(I, log);

figure(6);
LUT(I, odwlog);

figure(7);
LUT(I, odwrotna);

figure(8);
LUT(I, pierwiastkowa);

figure(9);
LUT(I, pila);

figure(10);
LUT(I, wykladnicza);

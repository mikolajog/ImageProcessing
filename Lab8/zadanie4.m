%Mikołaj Ogarek

% Punkt 1
clear;
clc;
close all;

% Punkt 2
calculator = imread('calculator.bmp');
image = calculator;

figure;
imshow(image);

% Punkt 3 
object = ones(1, 71);

marker = imerode(image, object);
mask = image;

reconstruction = imreconstruct(marker, mask);

readyImage = image - reconstruction;

% Punkt 4
readyImage2 = imtophat(image, object);

figure;
subplot(3,1,1);
imshow(image);
title('Original');
subplot(3,1,2);
imshow(readyImage);
title('Reconstruction');
subplot(3,1,3);
imshow(readyImage2);
title('Opened');

% Punkt 5

vertObject = ones(1,11);
vertEroded = imerode(readyImage, vertObject);
readyImage3 = imreconstruct(vertEroded, readyImage);

figure;
imshow(readyImage3);

% Punkt 6
signsObject = ones(1, 21);
dilatateMarker = imdilate(readyImage3, signsObject);
readyImage4 = imreconstruct(min(dilatateMarker, readyImage2), readyImage2);
figure;
imshow(readyImage4);

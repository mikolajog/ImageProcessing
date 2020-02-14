% Mikolaj Ogarek

% Punkt 1
clear;
clc;
close all;

% Punkt 2
dom = imread('dom.png');
image = dom;

% Punkt 3
detection1 = edge(image, 'log');
figure;
imshow(detection1);
title('log');

% Punkt 1 Canny
detection2 = edge(image, 'canny');
figure;
imshow(detection2);
title('canny');

% Punkt 1 Sobel 
detection3 = edge(image, 'sobel');
figure;
imshow(detection3);
title('sobel');


% Punkt d porównanie
figure;

subplot(1, 4, 1);
imshow(image);
title('img');

subplot(1, 4, 2);
imshow(edge(image, 'log', 0.01));
title('log');

subplot(1, 4, 3);
imshow(edge(image, 'canny', [0.19, 0.2]));
title('canny');

subplot(1, 4, 4);
imshow(edge(image, 'sobel', 0.15));
title('sobel');
%Mikołaj Ogarek

%przygotowanie
clear;
clc;
close all;

%wczytanie
image = imread('shapes.png');

%% shapes.png

labeled = bwlabel(image, 4);

coefs = obliczWspolczynniki(labeled);

figure;
imshow(labeled);
title('labeled');

%ponumeruj 
r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end

[height, width] = size(labeled);

%eliminacja niepożądanych obiektów
for y=1:height
    for x=1:width
        pixel = labeled(y,x); % obliczanie srodka ciezkosci
        if (pixel ~= 0 && ~(coefs(pixel, 2) > 0.38 && coefs(pixel, 2) < 0.53))
            labeled(y,x) = 0;
        end
    end
end

figure;
imshow(labeled);

%% czyszczenie

image = imread('shapesReal.png');

figure;
imshow(image);

% binaryzacja
image = im2bw(image, 0.21);

% czyszczenie krawedzi
image = imerode(image, strel('rectangle', [2, 2]));
image = not(image);
image = imclearborder(image);

figure;
imshow(image);

%% shapesReal.png
labeled = bwlabel(image, 4);

coefs = obliczWspolczynniki(labeled);

figure;
imshow(labeled);
title('labeled');

%ponumeruj
r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end

[height, width] = size(labeled);

%eliminacja niepożądanych obiektów
for y=1:height
    for x=1:width
        pixel = labeled(y,x); % obliczanie srodka ciezkosci
        if (pixel ~= 0 && ~(coefs(pixel,2) > 0.6 && coefs(pixel,2) < 0.68 && coefs(pixel, 3) > 4.5))
            labeled(y,x) = 0;
        end
    end
end

%wyświetl
figure;
imshow(labeled);
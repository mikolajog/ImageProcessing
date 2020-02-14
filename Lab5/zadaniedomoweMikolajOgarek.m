% Mikołaj Ogarek
% Zadanie domowe Lab 5

close all;
clearvars;
clc;

tekstReczny = imread('tekstReczny.png');

% Show Image
figure(1); 
imshow(tekstReczny);

% Show histogram
figure(2); 
imhist(tekstReczny);

% Otsu
thr = otsuthresh(imhist(tekstReczny, 255));
Binar(3, tekstReczny, thr*255);

% Manual
Binar(4,tekstReczny,0);

% Moving average method
[width, height] = size(tekstReczny);
n= 20;
a= 0.5;
Q = zeros(1, n);

k = 1;
avg = 0;
for x = 1:width
    for y = 1:height
        
        k_last = mod(k, 20) + 1;
        avg = avg / n;
       
        k = mod(k, 20) + 1;
        
        
        T = a * avg;
        if tekstReczny(x,y) > T,
            tekstReczny(x,y) = 255;
        else
            tekstReczny(x,y) = 0;
        end
    end
end

figure(5);
imshow(tekstReczny);


function Binar(numberFigure, img, i)

binaryImage = im2bw(img, i/255);
figure(numberFigure);

subplot(3,1,1);
imshow(img);
title('Original');
subplot(3,1,2);
imhist(img, 256);
title('Histogram');
subplot(3,1,3);
imshow(binaryImage);
title('Binary');

end
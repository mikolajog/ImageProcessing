% Mikolaj Ogarek

% Punkt 1
clear;
clc;
close all;


% Punkt 2
image = imread('fingerprint.bmp');
thinnedImage1 = bwmorph(image, 'thin', 1);
thinnedImage2 = bwmorph(image, 'thin', 2);
thinnedImageInf = bwmorph(image, 'thin', Inf);

figure;
subplot(2,2,1);
imshow(image);
title('original');
subplot(2,2,2);
imshow(thinnedImage1);
title('thin 1');
subplot(2,2,3);
imshow(thinnedImage2);
title('thin 2');
subplot(2,2,4);
imshow(thinnedImageInf);
title('thin Inf');

% Punkt 3
image = imread('kosc.bmp');
skeletedImage = bwmorph(image, 'skel', Inf);

figure;
subplot(1,2,1);
imshow(image);
title('original');
subplot(1,2,2);
imshow(skeletedImage);
title('skel');

% Punkt 4 i 5

image = imread('text.bmp');
square = strel('square', 3);
SE = ones(51, 1);

readyImage = image; 
readyImage = imerode(readyImage, square);
readyImage = imdilate(readyImage, square);

marker = imerode(image, SE);
mask = image;
reconstructed = imreconstruct(marker, mask);

figure;
subplot(2,2,1);
imshow(image);
title('original');
subplot(2,2,2);
imshow(readyImage);
title('opened');
subplot(2,2,3);
imshow(reconstructed);
title('reconstructed');


% Punkt 6
image = imread('text.bmp');

figure;
imshow(imfill(image,'holes'));
title('fill');

% Punkt 7
image = imread('text.bmp');

figure;
imshow(imclearborder(image));
title('clearborder');
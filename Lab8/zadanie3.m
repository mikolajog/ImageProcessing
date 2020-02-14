%Mikolaj Ogarek

% Punkt 1
clear;
clc;
close all;

% Punkt 2
ferrari = imread('ferrari.bmp');
image = ferrari;

square = strel('square', 3);

eroded = imerode(image, square);
dilatated = imdilate(image, square);

erodedSubtr = image - eroded;
dilatatedSubtr = image - dilatated;

figure;
subplot(3,2,1);
imshow(image);
title('original');
subplot(3,2,3);
imshow(eroded);
title('eroded');
subplot(3,2,4);
imshow(dilatated);
title('dilatated');
subplot(3,2,5);
imshow(erodedSubtr);
title('eroded diff');
subplot(3,2,6);
imshow(dilatatedSubtr);
title('dilatated diff');

% Punkt 3
opened = imopen(image, square);
closed = imclose(image, square);


figure();
subplot(2,1,1);
imshow(closed);
title('closed');
subplot(2,1,2);
imshow(opened);
title('opened');


% Punkt 4
tophat = imtophat(image, square);
bothat = imbothat(image, square);

figure()
subplot(2,1,1);
imshow(tophat);
title('tophat');
subplot(2,1,2);
imshow(bothat);
title('bothat');

% Punkt 5

rice = imread('rice.png');
image = rice;

disk = strel('disk', 10);
subplot(1,3,1);
imshow(image);
subplot(1,3,2);
imshow(imtophat(image, disk));
title('tophat');
subplot(1,3,3);
imshow(imbothat(image, disk));
title('bothat');
% Binaryzacja na podstawie histogramu


% Point 1
clc;
close all;
clearvars;

% Point 2
image = imread('coins.png');

figure(1);
subplot(2,1,1);
imshow(image);
title('Coins.png');
subplot(2,1,2);
imhist(image);

% Point 3
Binar(2,image,90); %threshold = 90

% Point 4
imgFigura = imread('figura.png'); 
Binar(3,imgFigura,90); %threshold = 90

imgFigura2 = imread('figura2.png'); 
Binar(4,imgFigura2,130); %threshold = 130

imgFigura3 = imread('figura3.png'); 
Binar(5,imgFigura3,180); %threshold = 180

imgFigura4 = imread('figura4.png'); 
Binar(6,imgFigura4,55); %threshold = 55


% Point 5

%Otsu
image = imread('coins.png');
thr = otsuthresh(imhist(image, 256));
Binar(7, image, thr*255);

%Point 6, 7

%Kittler
thr= clusterKittler(image);
Binar(8,image,thr);

%Yen
thr = entropyYen(image);
Binar(9,image,thr);

% Point 8

comparing(10, imread('coins.png'), 90);
comparing(11, imread('rice.png'), 110); %poprawic
comparing(12, imread('tekst.bmp'), 190);
comparing(13, imread('obiekty.bmp'), 160);
comparing(14, imread('katalog.bmp'), 110);



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




function comparing(numFigure, img, i)

figure(numFigure);
subplot(3,2,1);
imshow(img);
title('Original');

subplot(3,2,2);
imhist(img, 256);
title('Histogram');

subplot(3,2,3);
imshow(im2bw(img, i/255));
title(strcat('Manual, ', 'thr: ', num2str(i)));

subplot(3,2,4);
thr = otsuthresh(imhist(img, 256));
imshow(im2bw(img, thr));
title(strcat('Otsu, ', 'thr: ', num2str(thr*256)));

subplot(3,2,5);
thr = clusterKittler(img);
imshow(im2bw(img, thr/255));
title(strcat('ClusterKittler, ', 'thr: ', num2str(thr)));

subplot(3,2,6);
thr = entropyYen(img);
imshow(im2bw(img, thr/255));
title(strcat('Yen, ', 'thr: ', num2str(thr)));
end
% Mikolaj Ogarek 

% Zadanie 1 i 2
close all;
clearvars; 
clc;

lenaSzum = imread('lenaSzum.bmp');

lenaFiltered = medfilt2(lenaSzum);

filter3 = fspecial('average', 3);
convulsedLena3 = uint8(conv2(lenaSzum, filter3, 'same'));

figure(1);
subplot(2,2,1);
imshow(lenaSzum);
title('Obraz originalny');
subplot(2,2,2);
imshow(lenaFiltered)
title('Obraz po filtracji medianowej');
subplot(2,2,3);
imshow(convulsedLena3)
title('Obraz po filtracji uśredniającej');
subplot(2,2,4);
imshow(imabsdiff(lenaSzum, lenaFiltered),[]);
title('Moduł różnicy');

% Zadanie 3

lenaPoster = lenaSzum;

for i = 1:10
  lenaPoster = medfilt2(lenaPoster, [5 5]);
end

figure(2);
subplot(1,2,1);
imshow(lenaSzum);
title('Obraz originalny');
subplot(1,2,2);
imshow(lenaPoster);
title('lena po posteryzacji');

% Zadanie 6 i 7 w pliku lenaRGBSzum.bmp


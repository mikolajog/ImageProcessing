%Mikołaj Ogarek

%Zadanie 1
clear;
clc;
close all;

load('maskiPP.mat');

%image = imread('kw.bmp');
image = imread('jet.bmp');

grad_show(image, R1);

grad_show(image, R2);

% Zadanie 2
grad_show(image, P1);

grad_show(image, P2);


%Zadanie 3
grad_show(image, S1);

grad_show(image, S2);


%Zadanie 4 i 5 
OW = sqrt((conv2(image, S1, 'same')).^2 + (conv2(image, S2, 'same')).^2);

OW2 = abs((conv2(image, S1, 'same')).^2) + abs((conv2(image, S2, 'same')).^2);

figure;
imshow(OW,[]);

figure;
imshow(OW2,[]);


function  grad_show(image, mask)

convoluted = uint8(conv2(image, mask, 'same'));

figure;
subplot(2,2,1);
imshow(convoluted + 128,[]);
title('Laplacian with +128');

subplot(2,2,2);
imshow(abs(convoluted),[]);
title('Laplacian with abs() ');

subplot(2,2,3);
imshow(image + convoluted + 128,[]);
title('IMG with +128');

subplot(2,2,4);
imshow(image + abs(convoluted),[]);
title('IMG with abs()');

end
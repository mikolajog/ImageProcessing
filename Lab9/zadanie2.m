% Mikolaj Ogarek

% Punkt 1
clear;
clc;
close all;

% Punkt 2
image = zeros(11);

% Punkt 3
image(2,9) = 1;

% Punkt 4
figure;
subplot(1,2,1);
imshow(image); 
title('original');
subplot(1,2,2);
imageHough1 = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

% Punkt 5
imshow(imageHough1, []);
title('hough');

% Punkt 6
image(2,2) = 1;

figure;
subplot(1,2,1);
imshow(image); 
title('original');
subplot(1,2,2);
imageHough2 = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);
imshow(imageHough2, []); 
title('hough');


% Punkt 7
image(7,3) = 1;
image(3,4) = 1;
[H, T, R] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);
figure;
imshow(H, []);


%Punkt 8

theta = 16;
rho = 84;

% Punkt 9
x = 0:0.1:10;
y = (R(rho) - x * cosd(T(theta))) / sind(T(theta));

% Punkt 10
figure;
imshow(image); 
hold on
plot(x+1,y+1);

clearvars;
close all;
clc;

%Exercise 2.2.3.1

%% parrot.bmp
I = imread('parrot.bmp');
figure(1);
imshow(I)

[Y1, newmap1] = imresize(I, 1.2, 'nearest');
figure(2);
imshow(Y1,newmap1);


[Y1, newmap1] = imresize(I, 1.2, 'bilinear');
figure(3);
imshow(Y1,newmap1);


[Y1, newmap1] = imresize(I, 1.2, 'bicubic');
figure(4);
imshow(Y1,newmap1);


%% chessboard.bmp
I = imread('chessboard.bmp');
figure(5);
imshow(I)

[Y1, newmap1] = imresize(I, 5.0, 'nearest');
figure(6);
imshow(Y1,newmap1);


[Y1, newmap1] = imresize(I, 5.0, 'bilinear');
figure(7);
imshow(Y1,newmap1);


[Y1, newmap1] = imresize(I, 5.0, 'bicubic');
figure(8);
imshow(Y1,newmap1);



%% clock.bmp
I = imread('clock.bmp');
figure(9);
imshow(I)

[Y1, newmap1] = imresize(I, 5.0, 'nearest');
figure(10);
imshow(Y1,newmap1);


[Y1, newmap1] = imresize(I, 5.0, 'bilinear');
figure(11);
imshow(Y1,newmap1);


[Y1, newmap1] = imresize(I, 5.0, 'bicubic');
figure(12);
imshow(Y1,newmap1);


%Exercise 2.2.3.2 
% Chessboard is advantaged becuase of symmetry (squares of black and
% white). 
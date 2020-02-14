%Mikolaj Ogarek
%Zad1
close all;
clearvars;
clc;

%Zad2
I = imread('ertka.bmp');

%Zad3
se = strel('square',3);
eroded = imerode(I,se);

%Zad4
figure(1);
subplot(1,2,1) , imshow(I);
subplot(1,2,2) , imshow(eroded);

%Zad6
for i = 1:3
    eroded3 = imerode(eroded,se);
end

figure(2);
subplot(1,3,1) , imshow(I);
subplot(1,3,2) , imshow(eroded);
subplot(1,3,3) , imshow(eroded3);

%Zad7
B = imread('buzka.bmp');
s = [1 0;0 1];
er = imerode(B,s);
figure(3)
subplot(1,2,1) , imshow(B)
subplot(1,2,2) , imshow(er)

%Zad8
se = strel('square',3);
im = imdilate(I,se);
eroded = imerode(I,se);
op = imopen(I,se);
cl = imclose(I,se);

%Zad9
figure(4);
subplot(1,5,1) , imshow(I), title('oryginal');
subplot(1,5,2) , imshow(im), title('dylatacja');
subplot(1,5,3) , imshow(eroded), title('erozja');
subplot(1,5,4) , imshow(op), title('otwracie');
subplot(1,5,5) , imshow(cl), title('zamkniecie');


%Zad13
H = imread('hom.bmp');
SE1 =[0 1 0; 1 1 1; 0 1 0];
SE2 =[1 0 1; 0 0 0; 1 0 1];
h = bwhitmiss(H,SE1,SE2);
figure(5);
imshow(h);

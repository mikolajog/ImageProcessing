clearvars;
close all;
clc;

%Exercise 1
I1 = imread('lena.bmp');
I2 = imread('jet.bmp');

figure(1);
imshow(I1);

figure(2);
imshow(I2);

%Exercise 2
figure(3);
K = imadd(I1,I2);
imshow(K);


%Exercise 3
figure(4);
K = imadd(I1,I2, 'uint16');
imshow(K,[]);


%Exercise 4
figure(5);
K1 = imlincomb(2,I1,1,I2,'uint16');
imshow(K1,[])


figure(6);
K1 = imlincomb(20,I1,5,I2,'uint16');
imshow(K1,[])


figure(7);
K1 = imlincomb(3.5,I1,8.9,I2,'uint16');
imshow(K1,[])


%Exercise 5
figure(8);
J = imsubtract(I1,I2);
imshow(J,[]);

%Exercise 6
figure(9);
J = imsubtract(int16(I1),int16(I2));
imshow(J,[]);


%Exercise 7
figure(10);
J = imabsdiff(I1,I2);
imshow(J,[]);


%Exercise 8
figure(11);
J = immultiply(I1,I2);
imshow(J,[]);

%Exercise 10
figure(12);
J = immultiply(I1,2);
imshow(J,[]);

maska = imread('kolo.bmp');
maska = boolean(maska);

figure(13);
J = immultiply(I1,maska);
imshow(J,[]);

%Exercise 11
figure(14);
J = imcomplement(I1);
imshow(J,[]);





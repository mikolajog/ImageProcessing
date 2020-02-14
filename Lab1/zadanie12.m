%Exercise 1.2.5
imfinfo('lena.bmp');
imfinfo('lena.jpg');

%Exercise 1.2.6
bmp = imread('lena.bmp');
jpg = imread('lena.jpg');
figure(1)
imshow(bmp)

figure(2)
imshow(jpg)

%Exercise 1.2.7
figure(3)
bmp_gray = rgb2gray(bmp);
imshow(bmp_gray)

%Exercise 1.2.8
imwrite(bmp_gray,'lena_gray.bmp');

%Exercise 1.2.9
colormap gray; 
figure(4)
mesh(bmp_gray);

figure(5);
plot(bmp_gray(10,:));

figure(6);
plot(bmp_gray(:,10));


%% Obrazy indeksowane

% Exercise 2
lena = imread('lena_gray.bmp');
[X, map] = gray2ind(lena, 256);

% Exercise 4
figure;
imshow(X, map);

% Exercise 5
figure;
map_2 = colormap(summer);
imshow(X, map_2);



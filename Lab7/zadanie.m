%Mikołaj Ogarek
clearvars;
clc;
close all;

load MR_data;
localWindow =[9 9];
img1 = I_noisefree;
img2 = I_noisy1;
img3 = I_noisy2;
img4 = I_noisy3;
img5 = I_noisy4;

imgArray = {img1,img2,img3,img4,img5};

imgConvArray = imgArray;

for i = 1:5
    imgConvArray{i} = convolution(imgArray{i}, localWindow);
end

imgBilateralArray = imgArray;

for i = 1:5
    imgBilateralArray{i} = bilateral(imgArray{i}, localWindow,1);
end

for i = 1:5
    figure(i);
    subplot(1,3,1);
    imshow(imgArray{i},[])
    title('Origin');
    subplot(1,3,2);
    imshow(imgConvArray{i},[])
    title('Convolution');
    subplot(1,3,3);
    imshow(imgBilateralArray{i},[])
    title('Bilateral');
end

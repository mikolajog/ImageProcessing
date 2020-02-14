%Mikołaj Ogarek
%Zadanie domowe Lab 3 


clearvars;
close all;
clc;

%read the image
rgbImage= imread('100zloty.jpg'); 

%show picture black and white
figure(1);
Im= rgbImage(:,:,1);
imshow(Im); 

figure(2);
[r,c]=size(Im); %count size
s=zeros(r,c,8); %make array of zeros


%loop when we assign values of bits
for k= 1:8
    for i=1:r
        for j=1:c
            s(i,j,k)=bitget(Im(i,j),k);
        end
    end
end

BitLayer8=s(:,:,8);
BitLayer7=s(:,:,7);
BitLayer6=s(:,:,6); 
BitLayer5=s(:,:,5); 
BitLayer4=s(:,:,4); 
BitLayer3=s(:,:,3); 
BitLayer2=s(:,:,2); 
BitLayer1=s(:,:,1); 


%Showing particular layers
subplot(3,3,1);  
imshow(BitLayer1);
title('Layer 1'); 

subplot(3,3,2);  
imshow(BitLayer2);
title('Layer 2'); 

subplot(3,3,3);  
imshow(BitLayer3);
title('Layer 3'); 

subplot(3,3,4);  
imshow(BitLayer4);
title('Layer 4'); 

subplot(3,3,5);  
imshow(BitLayer5);
title('Layer 5'); 

subplot(3,3,6);  
imshow(BitLayer6);
title('Layer 6'); 

subplot(3,3,7);  
imshow(BitLayer7);
title('Layer 7'); 

subplot(3,3,8);  
imshow(BitLayer8);
title('Layer 8'); 

%Reconstruction image out of layers
uint8Image = uint8(BitLayer1 + 2*BitLayer2 + 4*BitLayer3  + 8*BitLayer4 + 16*BitLayer5 + 32*BitLayer6 + 64*BitLayer7 + 128*BitLayer8);
subplot(3,3,9); 
imshow(uint8Image); 
title('Reconstruction');

%Comparison
figure(3);
subplot(2,1,1); 
imshow(Im); 
title('Original');
subplot(2,1,2); 
imshow(uint8Image); 
title('Reconstruction');

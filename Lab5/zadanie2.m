% Binaryzacja lokalna

clc;
close all;
clearvars;

rice = imread('rice.png');
katalog = imread('katalog.bmp');

% Local
riceB= localBin(rice,15);
katalogB = localBin(katalog,15);

figure(1);
subplot(2,1,1);
imshow(rice);
title('Originall');
subplot(2,1,2);
imshow(riceB);
title('Local Binary');

figure(2);
subplot(2,1,1);
imshow(katalog);
title('Original');
subplot(2,1,2);
imshow(katalogB);
title('Local Binary');

% Sauvoli
riceSauvoli = Sauvoli(rice, -0.15, 128, 15);
katalogSauvoli = Sauvoli(katalog, 0.15, 128, 15);

figure(3);
subplot(2,1,1);
imshow(rice);
title('Original');
subplot(2,1,2);
imshow(riceSauvoli);
title('Sauvoli');

figure(4);
subplot(2,1,1);
imshow(katalog);
title('Original');
subplot(2,1,2);
imshow(katalogSauvoli);
title('Sauvoli');



function imageB = localBin(image, W2)

[X, Y] = size(image);
imageB = image;


for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j, floor(W2/2),image,X,Y);
        if image(i,j) > mean
            imageB(i,j) = 255;
        else
            imageB(i,j) = 0;
        end
    end
end
end


function imageS = Sauvoli(image, k, R, W2)

[X, Y] = size(image);
imageS = image;

for i = 1:X
    for j = 1:Y
        mean = meanLT(i, j, floor(W2/2), image, X, Y);
        sd = stddevLT(i, j, floor(W2/2), image, mean, X, Y);
        threshold = mean * (1 + k *(sd/R - 1));
        if image(i,j) > threshold
            imageS(i,j) = 255;
        else
            imageS(i,j) = 0;
        end
    end
end

end

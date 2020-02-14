%Exercise 2.2.1.1
clearvars;
close all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%parrot.bmp%%%%%%%%%%%%%%%%%%%%%

%Exercise 2.2.1.2
I = imread('parrot.bmp');
figure(1);
imshow(I)

%Exercise 2.2.1.3
xReScale = 1.5;
yReScale = 1.5;

%Exercise 2.2.1.4
[YY,XX] = size(I);
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

%Exercise 2.2.1.5, 2.2.1.6, 2.2.1.7, 2.2.1.8

%step
yStep = YY/nYY;
xStep = XX/nXX;

%the loop
for ii = 0:nYY-1
    for jj = 0:nXX - 1
        i = round(ii * yStep);
        j = round(jj * xStep);
        
        % when we exceed range
        if(i > YY - 1)
            i = YY - 1;
        end
        
        if(j > XX - 1)
            j = XX - 1;
        end
        
        %new pixel value
        nI(ii + 1, jj + 1) = I(i + 1, j + 1);
        
    end
end

%display
figure(2);
imshow(nI);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%chessboard.bmp%%%%%%%%%%%%%%%%%%%%%
%Exercise 2.2.1.2
I = imread('chessboard.bmp');
figure(3);
imshow(I)

%Exercise 2.2.1.3
xReScale = 1.5;
yReScale = 1.5;

%Exercise 2.2.1.4
[YY,XX] = size(I);
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

%Exercise 2.2.1.5, 2.2.1.6, 2.2.1.7, 2.2.1.8

%step
yStep = YY/nYY;
xStep = XX/nXX;

%the loop
for ii = 0:nYY-1
    for jj = 0:nXX - 1
        i = round(ii * yStep);
        j = round(jj * xStep);
        
        % when we exceed range
        if(i > YY - 1)
            i = YY - 1;
        end
        
        if(j > XX - 1)
            j = XX - 1;
        end
        
        %new pixel value
        nI(ii + 1, jj + 1) = I(i + 1, j + 1);
        
    end
end

%display
figure(4);
imshow(nI);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%clock.bmp%%%%%%%%%%%%%%%%%%%%%
%Exercise 2.2.1.2
I = imread('clock.bmp');
figure(5);
imshow(I)

%Exercise 2.2.1.3
xReScale = 1.5;
yReScale = 1.5;

%Exercise 2.2.1.4
[YY,XX] = size(I);
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

%Exercise 2.2.1.5, 2.2.1.6, 2.2.1.7, 2.2.1.8

%step
yStep = YY/nYY;
xStep = XX/nXX;

%the loop
for ii = 0:nYY-1
    for jj = 0:nXX - 1
        i = round(ii * yStep);
        j = round(jj * xStep);
        
        % when we exceed range
        if(i > YY - 1)
            i = YY - 1;
        end
        
        if(j > XX - 1)
            j = XX - 1;
        end
        
        %new pixel value
        nI(ii + 1, jj + 1) = I(i + 1, j + 1);
        
    end
end

%display
figure(6);
imshow(nI);



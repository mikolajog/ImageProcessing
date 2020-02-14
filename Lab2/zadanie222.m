
clearvars;
close all;
clc;
%% Scale=1.5
%Exercise 2.2.2

I = imread('parrot.bmp');
figure(1);
imshow(I)


xReScale = 1.5;
yReScale = 1.5;


[YY,XX] = size(I);
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

yStep = YY/nYY;
xStep = XX/nXX;

%the loop
% rescaling loop
for ii = 0:nYY-1
    for jj = 0:nXX - 1
        i1 = floor(ii * xStep);
        j1 = floor(jj * yStep);
        i2 = i1+1;
        j2 = j1+1;
        
        % out of bounds securing
        if (i2 >XX-1)
            i1 = XX-2;
            i2 = XX-1;
        end
        if (j2 > YY-1)
            j1 = YY-2;
            j2 = YY-1;
        end
        
        %to get values <0,1)
        i_ = ii*xStep - i1;
        j_ = jj*yStep - j1;
        
        
        f_a = double(I(j1+1,i1+1));
        f_b = double(I(j1+1,i2+1));
        f_c = double(I(j2 + 1, i2 + 1));
        f_d = double(I(j2 + 1,i1 + 1));
        
        nI(jj+1, ii+1) = [1-i_ i_] * [f_a f_d; f_b f_c] * [1-j_; j_];
    end
end

%display
figure(2);
imshow(nI);


%% Scale = 3.0

%Exercise 2.2.2

I = imread('parrot.bmp');

xReScale = 3.0;
yReScale = 3.0;


[YY,XX] = size(I);
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

yStep = YY/nYY;
xStep = XX/nXX;

%the loop
% rescaling loop
for ii = 0:nYY-1
    for jj = 0:nXX - 1
        i1 = floor(ii * xStep);
        j1 = floor(jj * yStep);
        i2 = i1+1;
        j2 = j1+1;
        
        % out of bounds securing
        if (i2 >XX-1)
            i1 = XX-2;
            i2 = XX-1;
        end
        if (j2 > YY-1)
            j1 = YY-2;
            j2 = YY-1;
        end
        
        %to get values <0,1)
        i_ = ii*xStep - i1;
        j_ = jj*yStep - j1;
        
        
        f_a = double(I(j1+1,i1+1));
        f_b = double(I(j1+1,i2+1));
        f_c = double(I(j2 + 1, i2 + 1));
        f_d = double(I(j2 + 1,i1 + 1));
        
        nI(jj+1, ii+1) = [1-i_ i_] * [f_a f_d; f_b f_c] * [1-j_; j_];
    end
end

%display
figure(3);
imshow(nI);

%% Scale = 4.5


%Exercise 2.2.2

I = imread('parrot.bmp');



xReScale = 4.5;
yReScale = 4.5;


[YY,XX] = size(I);
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

yStep = YY/nYY;
xStep = XX/nXX;

%the loop
% rescaling loop
for ii = 0:nYY-1
    for jj = 0:nXX - 1
        i1 = floor(ii * xStep);
        j1 = floor(jj * yStep);
        i2 = i1+1;
        j2 = j1+1;
        
        % out of bounds securing
        if (i2 >XX-1)
            i1 = XX-2;
            i2 = XX-1;
        end
        if (j2 > YY-1)
            j1 = YY-2;
            j2 = YY-1;
        end
        
        %to get values <0,1)
        i_ = ii*xStep - i1;
        j_ = jj*yStep - j1;
        
        
        f_a = double(I(j1+1,i1+1));
        f_b = double(I(j1+1,i2+1));
        f_c = double(I(j2 + 1, i2 + 1));
        f_d = double(I(j2 + 1,i1 + 1));
        
        nI(jj+1, ii+1) = [1-i_ i_] * [f_a f_d; f_b f_c] * [1-j_; j_];
    end
end

%display
figure(4);
imshow(nI);






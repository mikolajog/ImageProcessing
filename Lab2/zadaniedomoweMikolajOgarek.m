% Mikołaj Ogarek grupa 3b
% Interpolacja dwusześcienna

clearvars; 
close all;
clc;

% Loading matrix provided 
A1 = load('a1.mat');

% Show image with imresize function
I = imread('parrot.bmp');
figure(1);
imshow(imresize(I,3.0,'nearest'))

% Scale
xReScale = 3.0;
yReScale = 3.0;

% Resolution of old image
[XX,YY] = size(I);

% New resolution
newXX = round(XX * xReScale);
newYY= round(YY * yReScale);

% New image
newImg = uint8(zeros(newXX,newYY));

% Steps counting
xStep = XX/newXX;
yStep = YY/newYY;

for yn = 1: newYY
    for xn = 1: newXX
        
        % pixels from old image
        y1 = floor(yn * yStep);
        x1 = floor(xn * xStep);        
        
        %We do not exceed range (0,XX) 
        if(x1 >= XX-1)
            x1 = XX -1 ;
        end
        
        if x1<=0
            x1=1;
        end
        
        %We do not exceed range (0,YY) 
        if(y1 > YY-1)
            y1 = YY-1;
        end
        if y1==0
            y1=1;
        end
        
        pA = [x1 y1];
        pB = [x1+1 y1];
        pC = [x1+1 y1+1];
        pD = [x1 y1+1];
        
        
        % As per instruction normalizing using A
        norm_x = xn * xStep - x1;
        norm_y = yn * yStep - y1;
        
        
        % Images A,B,C,D
        A = I(x1, y1);
        B = I(x1+1, y1);
        C = I(x1+1, y1+1);
        D = I(x1, y1+1);
        
        [Ax, Ay, Axy] = derivative(pA, XX, YY, I);
        [Bx, By, Bxy] = derivative(pB, XX, YY, I);
        [Cx, Cy, Cxy] = derivative(pC, XX, YY, I);
        [Dx, Dy, Dxy] = derivative(pD, XX, YY, I);
        
        x = [A B D C Ax Bx Dx Cx Ay By Dy Cy Axy Bxy Dxy Cxy].'; % .' opeartor is transposition 
        
        a = A1.A1 * double(x); %A1.A1 because A1 includes A1 structure
        
        % Make result 4x4
        matrix_a = reshape(a,[4,4]); 
        
        % Equation found at https://en.wikipedia.org/wiki/Bicubic_interpolation
        new_image(xn, yn) = [1 norm_x norm_x^2 norm_x^3] * matrix_a * [1 norm_y norm_y^2 norm_y^3].'; 
      
    end
end

% Show new image
figure(2);
I2 = uint8(new_image);
imshow(I2);


% Function derivative used earlier to calculate partial derivatives
function [pointx, pointy, pointxy] = derivative(X, XX, YY, I)

%We do not exceed range (0,XX) 
bef_i = X(1);
if bef_i <= 0
    bef_i = 1;
end

aft_i = X(1) + 1;
if aft_i >= XX
    aft_i = XX;
end

%We do not exceed range (0,YY) 
bef_j = X(2);
if bef_j <= 0
    bef_j = 1;
end

aft_j = X(2) + 1;
if aft_j >= YY
    aft_j = YY;
end

pointx = (I(aft_i,X(2))-I(bef_i,X(2)))/2;
pointy = (I(X(1),aft_j)-I(X(1),bef_j))/2;
pointxy = (I(aft_i,aft_j)-I(bef_i,X(2))-I(X(1),bef_j)+I(X(1),X(2)))/4;

end
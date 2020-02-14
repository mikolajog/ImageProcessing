%Mikołaj Ogarek

%Punkt 1
clear;
clc;
close all;

%Punkt 2
umbrella = imread('umbrealla.png');
image = umbrella;

%Punkt 3
figure;
imshow(image, []);
title('original image');
 
imageHSV = rgb2hsv(image);
imageH = double(imageHSV(:,:,1));

figure;
imshow(imageH, []);
title('H vector');


% Deklaracja i Inicjalizacja globalnych zmiennych do split 
global sLimit vLimit MRes segRes index;

sLimit = 4;
vLimit = 0.05;
index = -1;

[y, x] = size(imageH);

segRes = zeros(y, x);
MRes = zeros(y, x);

% Wywołanie funkcji split
split(imageH, 1, 1, x, y);


% Parameters
colorThreshold = 5/255;
minAreaSize = 20;

%Punkt 9
i = 0;
while i <= index
    %wycinamy maske pikseli o rozpatrywanym indeksie
   IB = segRes == i;
   
   if any(IB(:))
       % Punkt 10 znajdujemy współrzędną lewego górnego rogu
       [yF, xF] = find(IB, 1, 'first');
       
       %Punkt 11
       
       square = strel('square', 3);
       neighbors = imdilate(IB, square);
       diff = imabsdiff(neighbors, IB);
       %otrzymujemy ramkę ktora wyorzystujemy do wyciacia fragmentu
       %macierzy segRes
       points = diff .* segRes;
       %wybieramy elementy niezerowe
       nonZeros = nonzeros(points);
       %..i unikalne
       uniqued = unique(nonZeros);
       
       
       % Punkt 12
       flag = 0; 
       
       for neighbor = 1:numel(uniqued)
           IBS = segRes == uniqued(neighbor);
           
           [yFS, xFS] = find(IBS, 1, 'first');
           %sprawdzay modul z roznicy 
           colorDiff = abs(MRes(yF,xF) - MRes(yFS, xFS));
           if colorDiff < colorThreshold
               segRes(IBS) = i;
               flag = 1;
           end
       end
       
       if flag == 0
          i = i + 1;
       end
   else %dla pustej maski inkrementujemy licznik i przechodzimy do nastepnej iteracji
       i = i + 1;
   end
end

figure;
imshow(segRes,[]);


%Punkt 14
U = unique(segRes);

for indeks = 1:length(U)
    %wycinamy maskę
    C = segRes == U(indeks);
    %jesli pole mniejsze od niz prog to =0
    if sum(C) < minAreaSize
       segRes(C) = 0; 
    end
end

%Punkt 15
U = unique(segRes);

for indeks = 1:length(U)
    C = segRes == U(indeks);
    segRes(C) = indeks;
end

finalImage = label2rgb(segRes);


figure;
imshow(finalImage);


%Punkt 4 procedura split
function split(image, xS, yS, xE, yE)
    global sLimit vLimit segRes index MRes
    
    %średnia i odchylenie standardowe dla fragmentu obrazu zamieniajac na wektor
    subImage = image(yS:yE,xS:xE);
    meanValue = mean(subImage(:));
    stdValue = std(subImage(:));
    
    %sprawdzamy czy odchylenie mniejsze niz prog i czy nie osiagnelismy
    %limitu podzialu
    if (stdValue < vLimit) || ((xE - xS) <= sLimit)
        %Punkt 7
        index=index + 1;
        segRes(yS:yE, xS:xE) = index;
        MRes(yS:yE, xS:xE) = meanValue;
    %Punkt 6 podobszar nie jest jednordony i nie osiagnelismy minimalnego
    %rozmiaru podobszaru to podzial na czesci
    else
        splitX = floor((xE + xS) / 2);
        splitY = floor((yE + yS) / 2);
        
        % wywolanie rekursywne dla 4 podobrazkow l1,l2,l3,l4
        split(image, xS, yS, splitX, splitY);
        split(image, xS, splitY + 1, splitX, yE);
        split(image, splitX + 1, yS, xE, splitY);
        split(image, splitX + 1, splitY + 1, xE, yE);
    end
end
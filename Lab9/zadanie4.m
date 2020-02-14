% Mikolaj Ogarek

clear;
clc;
close all;

% wczytanie obrazow

lab112 = imread('lab112.png');
dom = imread('dom.png');
image = lab112;

figure;

% binaryzacja
image = im2bw(image, 37/255);

% wyczyszczenie krawedzi
image = not(image);
image = imclearborder(image);
image = not(image);

% usuniecie vertykalnych linii
square = strel('square', 5);
image = imclose(image, square);

imshow(image);

% krewedzie
edges = edge(image, 'canny');

%hough
[H, T, R] = hough(edges);

%przestrze hougha, Punkt 4 
figure;
imshow(H, []);
P = houghpeaks(H, 8);
hold on;
plot(P, 'o');

%Punkt 3 detekcja linii na obrazie

lines = houghlines(edges, T, R, P, 'FillGap', 5, 'MinLength', 7);
figure, imshow(edges), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
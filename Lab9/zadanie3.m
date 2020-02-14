% Mikolaj Ogarek

% Punkt 1 i 2
clear;
clc;
close all;

img = imread('kwadraty.png');

e = edge(img, 'canny');

figure(1);

subplot(2, 1, 1);
imshow(e);

subplot(2, 1, 2);
imshow(img);


% Punkt 3
[H, T, R] = hough(e);

% Punkt 4
figure;
imshow(H, []);

% Punkt 5 i 6 i 7 i 8
P = houghpeaks(H, 8);
hold on;
plot(P, 'o');


% Punkt 9 i 10

lines = houghlines(e, T, R, P, 'FillGap', 5, 'MinLength', 7);
figure(3), imshow(e), hold on
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

% highlight the longest line segment by coloring it cyan.
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');


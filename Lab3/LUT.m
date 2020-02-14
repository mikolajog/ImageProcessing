function LUT(obraz, przekodowanie)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

subplot(2,2,3);
imshow(obraz);
title('Original');
    
subplot(2,2,1:2); 
plot(przekodowanie); 
title('Wykres');
    
subplot(2,2,4); 
imshow(intlut(obraz,przekodowanie)); 
title('Przekodowany');


end


%Mikołaj Ogarek
%Indeksacja
clearvars;
clc;
close all;

%wczytanie i wyświetlenie
I = imread('ccl1.png');
imshow(I);


[XX,YY] = size(I);

Obraz = zeros(XX,YY);

L = 0;
id = 1:100;

%iterujemy po XX i YY
for i = 1:XX
    for j = 1:YY
        if(I(i,j) == 255 && i>1 && j>1) %sprawdzenie czy 
            sasiedzi = [Obraz(i-1,j-1), Obraz(i-1,j),Obraz(i-1,j+1), Obraz(i,j-1)];
            suma = sum(sasiedzi);
            if(suma == 0)
                Obraz(i,j) = L+1;
                L = L+1;
            end
            if(suma > 0)
                el = nonzeros(sasiedzi); %eliminujemy zera z wektora sasiedzi
                elMin = min(el); %minimum nowego wektora
                elMax = max(el); %maksimum nowego wektora
                if(elMin == elMax)
                    Obraz(i,j) = elMin; %jako etykiete minimum=maksimum
                else
                    Obraz(i,j) = elMin; %jako minimum
                    id = union(elMin,elMax,id); %w przypadku wystąpienia konfliktu tworzymy unię pomiędzy mniejszą i większą
                end
            end
            
        end
    end
end


lut = id;

%pierwszy przebieg, przekodowanie LUT
for i = 1:100
    lut(i) = root(id(i),lut);
end

%drugi przebieg po obrazie
for i = 1:XX
    for j = 1:YY
        if(Obraz(i,j)>0) %dla każdego piksela, który nie jest tłem
            Obraz(i,j) = lut(Obraz(i,j)); %przekodowanie lut
        end
    end
end

%result = label2rgb(Obraz);
%figure,
%imshow(result,[])

figure,
res = imread('ccl1Result.png');
imshow(res);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%funkcja root - obliczanie korzenia zgodnie z podanym opisem
function index = root(elIndex,table)
    index = elIndex;
    while index ~= table(index)
        index = table(index);
    end
end


%union - połącz - wprowadz połączenie między dwoma obiektami
function result = union(p,q,id)
    result = id;
    if p< q
        result(root(p,id)) = root(q,id);
    else
        result(root(q,id)) = root(p,id);
    end
end


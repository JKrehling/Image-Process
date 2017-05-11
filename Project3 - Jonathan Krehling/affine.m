%Affine matrix script
%Jonathan Krehling

%To use this script select which parameters you want and run
clear
I = imread('veg.png'); %open image
if size(I, 3) == 3
    I = rgb2gray(I); 
end

[y,x] = size(I); %determine size of image
theta = 45; %angle of rotation
Sx = 2; %scaling in x direction
Sy = 2; %scaling in y direction
Tx = 0; %translation in x direction
Ty = 0; %translation in y direction
G=[Sx*cosd(theta) Sy*sind(theta) Tx;-Sx*sind(theta) Sy*cosd(theta) Ty; 0 0 1];

%G = [5 0 1; 0 5 1; 0 0 1]; %contains arbitrary values, can be changed
A=zeros(y, x); %declares new image matrix
shift = round(G*[x/2;y/2;1]); %finds the centre of the image in new coordinate space
for countx = 1:x
    for county = 1:y
    X = countx + shift(1,1)-x/2;%shifts the point to the transformed coordinate
    Y = county + shift(2,1)-y/2;
    xprime = (G^-1)*[X;Y;1]; %does the inverse transform on the new point to determine the corresponding point in the original image 
    pround = round(xprime); %rounds points to integer value
    if pround(1,1) > 0 && pround(1,1) < x+1  %ensures pixel value is within the coordinates of the image, if not the value is discarded
        if pround(2,1) > 0 && pround(2,1) < y+1
            A(county,countx) = I(pround(2,1),pround(1,1)); %puts newly calculated image value into new matrix
        end
    end
    end
end

imshow(A, [])

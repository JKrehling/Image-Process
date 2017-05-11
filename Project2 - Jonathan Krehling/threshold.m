%Threshold Function
%Jonathan Krehling

function threshold(input, T) %declaries function, input image, and threshold T

I = imread(input); %open image
if size(I, 3) == 3
    I = rgb2gray(I);
end
[x,y] = size(I);
[maxVal,maxInd] = max(I(:)); %finds maximum value of image
for countx = 1:x %loops through each x position
    for county = 1:y %loops through each y position
        if I(countx, county) <= T
            I(countx,county) = 0; %minimum threshold
        else
            I(countx,county) = maxVal; %maximum threshold
        end
    end
end
figure; 
imshow(I);
title(['Threshold ', input]);
end

 





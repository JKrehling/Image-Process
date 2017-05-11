% BARGRAPH FUNCTION
% JONATHAN KREHLING

function bargraph(input)  %declares function and input variable
I = imread(input); %open image
if size(I, 3) == 3
    I = rgb2gray(I);
end
[x,y] = size(I); %determine size of image
[maxVal,maxInd] = max(I(:)); %maximum pixel value of linearized image
[minVal,minInd] = min(I(:)); %minimum pixel value of linearized image
arraynum = double(maxVal)+1; %number of elements required by the array
bins = zeros(arraynum,1); %creates an array for counting each image value

for countx = 1:x %loops through each x position
    for county = 1:y %loops through each y position
        colVal = I(countx,county); %placeholder variable
        index = double(colVal) + 1; %finds the index for the counting array
        bins(index) = bins(index) + 1;%array to count grayscale values
    end
end
figure %function to display histogram
bar(bins); %bargraph plotting routine
title('Image Histogram')
xlabel('GrayScale Value')
ylabel('Frequency Count')

end
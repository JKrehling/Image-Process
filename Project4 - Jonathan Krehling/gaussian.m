%Gaussian kernel function
%Jonathan Krehling

function gaussian(input, sigma)

G=zeros(2*3*sigma+1, 2*3*sigma+1); %kernal matrix nxn odd matrix
[yg,xg] = size(G); %determines size of matrix
centre = (xg+1)/2; %finds the centre of the matrix

for countx = 1:xg %each row of filter G
    for county = 1:yg %each column of filter G
    G(countx,county) = 1/(2*pi*sigma^2)*exp(-0.5*((centre-countx)^2+(centre-county)^2)/sigma^2);    
    end
end

norm = sum(sum(G)); %finds the sum of all elements of matrix
G = G./norm; %divides each element of matrix by the sum to normalize

Iout = maskfilter(G, input); %calls the filter function and passes the filter
imshow(Iout,[]) %dispays image
end
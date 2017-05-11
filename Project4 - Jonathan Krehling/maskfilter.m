%Image Filter Function
%Jonathan Krehling

function A = kernalmask(G, input)
I = imread(input); %open image
if size(I, 3) == 3
    I = rgb2gray(I);
end
[y,x] = size(I); %determine size of image
[yg,xg] = size(G); %determines size of filter
if rem(xg,2) == 0 || xg ~= yg
    disp('matrix does not have dimensions n x n where n is an odd integer')
    return
end

offset = 0.5*(xg + 1); %finds the middle of the filter matrix
A=zeros(y,x); %sets an empty image to map the filtered image to
J=zeros(y+2*offset-2, x+2*offset-2); %creates an empty padded image


for county = 1:y;
    for countx = 1:x;
        J(county+offset-1,countx+offset-1) = I(county,countx); %puts opened image I in center of padded image
    end
end


for countx = offset:x+offset-1 %each row
    for county = offset:y+offset-1 %each column
        C=0;
        for countx2 = 1:xg %counts the element for the kernal in x direction
            for county2 = 1:yg %counts the element for kernal in y direction
                C = C + G(county2,countx2)*J(county-offset+county2, countx-offset+countx2); %sums the value for the pixel of interest
            end
        end
    A(county-offset+1,countx-offset+1) = C;
    end
end

return

end
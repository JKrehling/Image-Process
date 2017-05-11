%Edge - normalized function
%Jonathan Krehling

function normedge(input)

Gx = [1 0 -1; 2 0 -2; 1 0 -1];
Gy = [1 2 1; 0  0 0; -1 -2 -1];

Iouthor = abs(maskfilter(Gy, input)); %horizontal image
Ioutvert = abs(maskfilter(Gx, input)); %vertical image
Itot = sqrt(Iouthor.^2+Ioutvert.^2); %squares and adds both images
figure
imshow(Itot,[])
title('Magnitude Gradient')

end
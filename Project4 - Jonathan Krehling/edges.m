%Edge finding function
%Jonathan Krehling
function edges(input)

Gx = [1 0 -1; 2 0 -2; 1 0 -1];
Gy = [1 2 1; 0  0 0; -1 -2 -1];

Iouthor = abs(maskfilter(Gy, input)); %horizontal image
Ioutvert = abs(maskfilter(Gx, input)); %vertical image

figure
imshow(Iouthor,[])
title('Horizontal Gradient')
figure
imshow(Ioutvert,[])
title('Vertical Gradient')
end
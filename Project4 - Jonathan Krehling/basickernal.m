%Basic kernal script
%Jonathan Krehling

input = 'NZ.jpg'; %input
G = [1 1 1; 1 1 1; 1 1 1];%image kernal
norm = sum(sum(G)); %finds the sum of all elements of matrix
G = G./norm; %divides each element of matrix by the sum to normalize
Iout = maskfilter(G, input); %calls filter function
figure
imshow(Iout,[])

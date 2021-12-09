close all
clear all

k =imread('C:/Users/i-Tech/Desktop/IM/1.jpg');
L = 256;

%% Test 1
figure(1)
B =(L-1)-k;
imshow(B);


%% Test 2
[M,N] = size(k);

for i=1:M-1
    for j=1:N-1
        
        k(i,j) = (L-1) - k(i,j);     
    end
end
figure(2)
imshow(k);
title('Negative of the picture');



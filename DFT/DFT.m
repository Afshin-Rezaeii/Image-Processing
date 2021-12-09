clear all
close all
clc

img =imread('C:/Users/i-Tech/Desktop/IM/Texture5.jpg');
N = size(img,2);
h = zeros(1,N);
img = complex(double(img));
% img = complex(im2double(img));
% w=0:size(N,N-1)

for w=0:N-1
    
    h(w+1) = exp(-2*pi*j*w/N);
end

m=zeros(N,N); % m(x,v) function
for x=0:N-1
    for v=0:N-1
        sum=0;
        for y=0:N-1
            z = mod(v*y,N);
            sum = sum + (img(x+1,y+1)).* h(z+1);
        end
        m(x+1,v+1) = sum/N;
    end
end

g=zeros(N,N); % g(u,v) function
for v=0:N-1
    for u=0:N-1
        sum=0;
        for x=0:N-1
            k=mod(u*x, N);
            sum = sum + (m(x+1,v+1)).* h(k+1);
        end
        g(u+1,v+1) = sum/N;
    end
end


img1 = log(1+abs(g));
imshow(img1);
title('Amplitude')

figure(2);
Gnew = ((img1-min(min(img1)))./((max(max(img1))-min(min(img1)))))*255;
imshow(Gnew);
title('Magnitude')

figure(3);
img2 = fftshift(img1);
imshow(img2);
title('FFt Shift')

            
            
            
            
            
            
        
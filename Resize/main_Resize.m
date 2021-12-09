close all
clear all
% warning ('off');

img = imread('1.jpg');

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

[M,N] = size(img);

NewX = input('Enter the x size: ');
NewY = input('Enter the y size: ');

ResizedImageX_R = zeros(M, NewX);
ResizedImageX_G = zeros(M, NewX);
ResizedImageX_B = zeros(M, NewX);

for i=1:M-1
    signal_R = resize(uint8(r(i,:,:)), NewX);
    signal_G = resize(uint8(g(i,:,:)), NewX);
    signal_B = resize(uint8(b(i,:,:)), NewX);    
    ResizedImageX_R(i,:,:) = (signal_R);
    ResizedImageX_G(i,:,:) = (signal_G);
    ResizedImageX_B(i,:,:) = (signal_B); 
end

Wrapped_x = [uint8(ResizedImageX_R), uint8(ResizedImageX_G), uint8(ResizedImageX_B)];
Wrapped_x = reshape(Wrapped_x, M, NewX, 3);
imshow(Wrapped_x);

ResizedImageY_R = zeros(NewY, NewX);
ResizedImageY_G = zeros(NewY, NewX);
ResizedImageY_B = zeros(NewY, NewX);

for i=1:NewX-1    
    signal_R1 = resize(ResizedImageX_R(:,i), NewY);
    signal_G1 = resize(ResizedImageX_G(:,i), NewY);
    signal_B1 = resize(ResizedImageX_B(:,i), NewY);
    ResizedImageY_R(:,i) = signal_R1;
    ResizedImageY_G(:,i) = signal_G1;
    ResizedImageY_B(:,i) = signal_B1;  
end

Wrapped_Y = [uint8(ResizedImageY_R), uint8(ResizedImageY_G), uint8(ResizedImageY_B)];
Wrapped_Y = reshape(Wrapped_Y, NewY, NewX, 3);
% wrapped_y = reshape(wrapped_y, newLX, newLX, 3);

imshow(Wrapped_Y);
title('Resized image');
% img_new = uint8(zeros([Wrapped_X0 Wrapped_X 3 ]));
% imshow(img_new);

figure;
imshow(img);
title('Orginal image');

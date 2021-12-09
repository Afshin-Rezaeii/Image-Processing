clear all
close all

%% Histogram Equaization

img =imread('1.jpg');
[Rhist,Ghist,Bhist,pixel] = HistCal(img);

[M,N,H] = size(img);

sumR = 0;
sumRR = zeros(256,1);

sumG = 0;
sumGG = zeros(256,1);

sumB = 0;
sumBB = zeros(256,1);

for i=1:length(Rhist)
    
    sumRR(i) = Rhist(i) + sumR;
    sumR = sumRR(i);
    
    sumGG(i) = Ghist(i) + sumG;
    sumG = sumGG(i);
    
    sumBB(i) = Bhist(i) + sumB;
    sumB = sumBB(i);
end

sumRR_new = (sumRR/pixel).*255;
sumGG_new = (sumGG/pixel).*255;
sumBB_new = (sumBB/pixel).*255;

figure(5);
plot(sumRR_new,'r');hold on;
plot(sumGG_new,'g');hold on;
plot(sumBB_new,'b');

k1 = img(:,:,1);
k2 = img(:,:,2);
k3 = img(:,:,3);

for i=1:M-1
    for j=1:N-1
        R = k1(i,j);
        k1(i,j) = round(sumRR_new(R+1));
        
        G = k2(i,j);
        k2(i,j) = round(sumGG_new(G+1));
        
        B = k3(i,j);
        k3(i,j) = round(sumBB_new(B+1));
        
    end
end


EnhanceImg = [k1,k2,k3];
EnhanceImg2 = reshape(EnhanceImg,M,N,H);

figure
subplot(311)
plot(k1, 'r');
title('Histogram Normalize of RGB Picture')
subplot(312)
plot(k2, 'g');
subplot(313)
plot(k3, 'b');


figure;
imshow(img);
figure(22);
imshow(EnhanceImg2);
title('Histogram Equalization')

% figure
% subplot(1,2,1);
% imshow(k);
% title('Original Image');
% b=rgb2hsv(k);
% b(:,:,3)=histeq(b(:,:,3));
% rs=hsv2rgb(b);
% subplot(1,2,2);
% imshow(rs);
% title('Image after Histogram Equalization');








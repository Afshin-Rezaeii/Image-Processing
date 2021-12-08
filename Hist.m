clear all
close all


%% HISTOGRAM

k = imread('C:/Users/i-Tech/Desktop/IM/1.jpg');
[M,N,H] = size(k);
Rhist = zeros(1,256);
Ghist = zeros(1,256);
Bhist = zeros(1,256);

r=k(:,:,1);
g=k(:,:,2);
b=k(:,:,3);
 
for i=1:M-1
   for j=1:N-1  
       R=r(i,j);
       Rhist(1,R+1) = Rhist(1,R+1)+1;
       G=g(i,j);
       Ghist(1,G+1) = Ghist(1,G+1)+1;
       B=b(i,j);
       Bhist(1,B+1) = Bhist(1,B+1)+1;
       
   end
end

plot(Rhist,'r');hold on;
plot(Ghist,'g');hold on;
plot(Bhist,'b');
title('Histogram of RGB Picture')

%% RGB imhist
% [r_hist, x1] = imhist(img(:, :, 1));
% [g_hist, x2] = imhist(img(:, :, 2));
% [b_hist, x3] = imhist(img(:, :, 3));
% 
% % Show Result
% figure()
% subplot(3, 1, 1)
% bar(x1, r_hist)
% title('Histogram of red plane', 'fontsize', 12)
% subplot(3, 1, 2)
% bar(x2, g_hist)
% title('Histogram of green plane', 'fontsize', 12)
% subplot(3, 1, 3)
% bar(x3, b_hist)
% title('Histogram of Blue plane', 'fontsize', 12)


%% Gray
% % Histogram
% bin = 1:256;
% hist = zeros(1,256);
% for i = 0 : 255
%     counts = (img == i);
%     hist(i+1) = sum(counts, [1, 2]);
% end
% % Show Result
% figure(2)
% bar(bin, hist)
% ylabel('No. of pixels with such intensity levels')
% xlabel('Intensity levels'), xlim([0 255])
% title('Histogram of image', 'fontsize', 14)



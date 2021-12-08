% close all;
clear all;

image = imread('C:/Users/i-Tech/Desktop/IM/1.jpg');
k = Noise(image);
Noisy_img = Noise(image);
[M,N]=size(image);
mask = ones(3)/9; % OR mask = 1/9.*([1 1 1; 1 1 1; 1 1 1]);

for i=2:1:M-1;
    for j=2:1:N-1;
        array=(Noisy_img(i-1,j-1)*mask(1, 1)+Noisy_img(i-1,j)*mask(1, 2)+Noisy_img(i-1,j+1)*mask(1, 3)+Noisy_img(i,j-1)*mask(2, 1) + Noisy_img(i,j)*mask(2, 2) + Noisy_img(i,j+1)*mask(2, 3)+Noisy_img(i+1,j-1)*mask(3, 1)+Noisy_img(i+1,j)*mask(3, 2)+Noisy_img(i+1,j+1)*mask(3, 3));
           
        Noisy_img(i,j)= array;

    end
end

figure('name','Average-Filter')
set(gcf,'Position',get(0,'Screensize'));
% subplot(1,3,1);imshow(image,[]);title('Orgianl Image')
subplot(1,2,1);imshow(k ,[]);title('Noise')
subplot(1,2,2);imshow(Noisy_img,[]);title('Average Filter')

%%
%  array=[Noisy_img(i-1,j-1)*mask(1, 1) + Noisy_img(i-1,j)*mask(1, 2) + Noisy_img(i-1,j+1)*mask(1, 3)
%                Noisy_img(i,j-1)*mask(2, 1) + Noisy_img(i,j)*mask(2, 2) + Noisy_img(i,j+1)*mask(2, 3)
%                Noisy_img(i+1,j-1)*mask(3, 1)+Noisy_img(i+1,j)*mask(3, 2)+Noisy_img(i+1,j+1)*mask(3, 3)];


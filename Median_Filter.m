close all;
clear all;

image = imread('C:/Users/i-Tech/Desktop/IM/1.jpg');
k = Noise(image);
Noisy_img = Noise(image);
[M,N]=size(image);

for i=2:1:M-1;
    for j=2:1:N-1;
        array=[Noisy_img(i-1,j-1),Noisy_img(i-1,j),Noisy_img(i-1,j+1)
               Noisy_img(i,j-1),Noisy_img(i,j),Noisy_img(i,j+1)
               Noisy_img(i+1,j-1),Noisy_img(i+1,j),Noisy_img(i+1,j+1)];
        array = sort(array);
        Noisy_img(i,j)= array(5);

    end
end

figure
set(gcf,'Position',get(0,'Screensize'));
subplot(1,2,1);imshow(k ,[]);title('Noise')
subplot(1,2,2);imshow(Noisy_img,[]);title('Median Filter')
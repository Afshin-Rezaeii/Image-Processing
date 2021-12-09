% close all;
clear all;

image = imread('C:/Users/i-Tech/Desktop/IM/1.jpg');
k = Noise(image);
Noisy_img = Noise(image);
[M,N]=size(image);

% Gaussian Filter 
G_Mask =[1 2 1
            2 4 2
            1 2 1];
G_Mask = (G_Mask/16); 

for i=2:1:M-1;
    for j=2:1:N-1;
        array=[Noisy_img(i-1,j-1),Noisy_img(i-1,j),Noisy_img(i-1,j+1)
               Noisy_img(i,j-1),Noisy_img(i,j),Noisy_img(i,j+1)
               Noisy_img(i+1,j-1),Noisy_img(i+1,j),Noisy_img(i+1,j+1)];
                      
        array=G_Mask.*double(uint8(array));
        array=round(sum(sum(array)));
        Noisy_img(i,j)= array;
        
    end
end

figure
set(gcf,'Position',get(0,'Screensize'));
subplot(1,2,1);imshow(k ,[]);title('Noise')
subplot(1,2,2);imshow(Noisy_img,[]);title('Guassian Filter')




%%
% I = double(Noisy_img);
% 
% %Design the Gaussian Kernel
% %Standard Deviation
% sigma = 1.76;
% %Window size
% sz = 4;
% [x,y]=meshgrid(-sz:sz,-sz:sz);
% 
% M = size(x,1)-1;
% N = size(y,1)-1;
% Exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
% Kernel= exp(Exp_comp)/(2*pi*sigma*sigma);
% 
% %Initialize
% Output=zeros(size(I));
% %Pad the vector with zeros
% I = padarray(I,[sz sz]);
% 
% %Convolution
% for i = 1:size(I,1)-M
%     for j =1:size(I,2)-N
%         Temp = I(i:i+M,j:j+M).*Kernel;
%         Output(i,j)=sum(Temp(:));
%     end
% end
% %Image without Noise after Gaussian blur
% Output = uint8(Output);
% figure,imshow(Output);

 
     
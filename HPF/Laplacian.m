close all;
clear all;

image = imread('camera_256.bmp');
% image = rgb2gray(image);
[M,N]=size(image);

laplace_img = image;
L_Mask = [0 -1 0
          -1 4 -1
          0 -1 0];  
      
for i=2:1:M-1;
    for j=2:1:N-1;
        array=[image(i-1,j-1),image(i-1,j),image(i-1,j+1)
               image(i,j-1),image(i,j),image(i,j+1)
               image(i+1,j-1),image(i+1,j),image(i+1,j+1)];
                      
        array=L_Mask.*double(uint8(array));
        array=round(sum(sum(array)));
        laplace_img(i,j)= array;
        
    end
end

figure('name','HPF')
subplot(1,2,1);imshow(image,[]);title('Orgianl Image')
subplot(1,2,2);imshow(laplace_img,[]);title('Laplacian')




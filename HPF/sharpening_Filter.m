close all;
clear all;

image = imread('camera_256.bmp');
% image = rgb2gray(image);
[M,N]=size(image);

image_sharp = image;
sharp_Mask = [-1 -1 -1
              -1  8  -1
              -1 -1 -1];  
      
for i=2:1:M-1;
    for j=2:1:N-1;
        array=[image(i-1,j-1),image(i-1,j),image(i-1,j+1)
               image(i,j-1),image(i,j),image(i,j+1)
               image(i+1,j-1),image(i+1,j),image(i+1,j+1)];
                      
        array=sharp_Mask.*double(uint8(array));
        array=round(sum(sum(array)));
        image_sharp(i,j)= array;
        
    end
end

figure('name','HPF')
subplot(1,2,1);imshow(image,[]);title('Orgianl Image')
subplot(1,2,2);imshow(image_sharp,[]);title('sharpening Filter')
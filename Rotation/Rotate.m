close all 
clear all

tic
img = imread('1.jpg');
[row,col,z]= size(img); 

angle = input('Enter the angle: ');
% angle = 180;
rads=2*pi*angle/360;  

rowsf=ceil(row*abs(cos(rads))+col*abs(sin(rads)));                      
colsf=ceil(row*abs(sin(rads))+col*abs(cos(rads)));                     

img_new=uint8(zeros([rowsf colsf 3 ]));

xo=ceil(row/2);                                                            
yo=ceil(col/2);

midx=ceil((size(img_new,1))/2);
midy=ceil((size(img_new,2))/2);

for i=1:size(img_new,1)
    for j=1:size(img_new,2)                                                       

         x= (i-midx)*cos(rads)+(j-midy)*sin(rads);                                       
         y= -(i-midx)*sin(rads)+(j-midy)*cos(rads);                             
         x=round(x)+xo;
         y=round(y)+yo;

         if (x>=1 && y>=1 && x<=size(img,1) &&  y<=size(img,2) ) 
              img_new(i,j,:)=img(x,y,:);  
         end

    end
end
toc
imshow(img_new);
title('Rotated Image');



clear all
close all

image=imread('camera_256.bmp');
imshow(image);
title('Original Input Image');
wy= [-1 -2 -1
      0  0  0
      1  2  1];

wx= [-1 0 1
     -2 0 2
     -1 0 1];
[M, N]=size(image);
for i=2:1:M-1
 for j=2:1:N-1
     Dx=[image(i-1,j-1),image(i-1,j),image(i-1,j+1)
               image(i,j-1),image(i,j),image(i,j+1)
               image(i+1,j-1),image(i+1,j),image(i+1,j+1)];
           
     Dy=[image(i-1,j-1),image(i-1,j),image(i-1,j+1)
               image(i,j-1),image(i,j),image(i,j+1)
               image(i+1,j-1),image(i+1,j),image(i+1,j+1)];
           
      Dx=wx.*double(uint8(Dx));
      Dx=round(sum(sum(Dx)));
      Gx(i,j)= Dx;
      
      Dy=wy.*double(uint8(Dy));
      Dy=round(sum(sum(Dy)));
      Gy(i,j)= Dy;
      
      S =abs(Dy)+abs(Dx);
      SS(i,j) = S;
      
      if  Gx(i,j) < 128
          Gx(i,j)=0;       
      else Gx(i,j)=1;
      end
      
      if Gy(i,j) < 128
          Gy(i,j)=0;
      else Gy(i,j)=1;
      end
      
 end
end


figure(2);
imshow(Gx,[]);
title('Edge Detection in y direction');
figure(3);
imshow(Gy,[]);
title('Edge Detection in x direction'); 
figure(4);
imshow(SS,[]);
title('Edge Detection');

function [Rhist,Ghist,Bhist,pixel] = HistCal(image)

[M,N,H] = size(image);
pixel = M*N;

Rhist = zeros(1,256);
Ghist = zeros(1,256);
Bhist = zeros(1,256);

r=image(:,:,1);
g=image(:,:,2);
b=image(:,:,3);

for i=1:M
   for j=1:N  
       
       R=r(i,j);
       Rhist(1,R+1) = Rhist(1,R+1)+1;
       
       G=g(i,j);
       Ghist(1,G+1) = Ghist(1,G+1)+1;
       
       B=b(i,j);
       Bhist(1,B+1) = Bhist(1,B+1)+1;
       
   end
end
end



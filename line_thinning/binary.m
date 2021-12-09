function [binary] = binary(img)
  
     [x, y, z]=size(img);
  
    if z==3
         img=rgb2gray(img);
    end

    img=double(img);
    sum=0;
    
    for i=1:x
         for j=1:y
        sum=sum+img(i, j);
         end
     end

    threshold=sum/(x*y);
    binary=zeros(x, y);
  
    for i=1:x
     for j=1:y
        if img(i, j) >= threshold
                binary(i, j) = 1;
        else
            binary(i, j)=0;
        end
     end
    end
end
  
 
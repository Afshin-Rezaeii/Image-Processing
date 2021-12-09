close all;
clear all;
            
global image_back;
global image_obj;

image=imread('1.jpg');
[M,N,H] = size(image);

r=image(:,:,1);
g=image(:,:,2);
b=image(:,:,3);

n_back = 0;
n_obj = 0;
sum_back = 0;
sum_obj = 0;

p = image;
T = 90;
tic
while(1==1)
    for i=1:1:M-1;
        for j=1:1:N-1;
            
            if (p(i,j) < T)
                n_back = n_back + 1;
                sum_back1 = sum_back + r(i,j);
                sum_back2 = sum_back + g(i,j); 
                sum_back3 = sum_back + b(i,j);
                sum_back_t = sum_back1 + sum_back2 + sum_back3;
            else
                n_obj = n_obj + 1;
                sum_obj1 = sum_obj + r(i,j);
                sum_obj2 = sum_obj + g(i,j);
                sum_obj3 = sum_obj + b(i,j);
                sum_obj_t = sum_obj1 + sum_obj2 + sum_obj3;
            end
        end
    end
    
    mu_back = n_back / sum_back_t;
    mu_obj = n_obj / sum_obj_t;
    T_new = (mu_back + mu_obj) / 2;
    
    if ( T == T_new)
        break
    else
        T = T_new;
    
    end
    
    for i=1:1:M-1;
        for j=1:1:N-1;
            if(image(i,j) <= T_new)
                image_back(i,j) = image(i,j);
            else
                image_obj(i,j) = image(i,j);
            end
        end
    end
   
      
end
toc
figure
subplot(2,2,1);imshow(image,[]);title('Orgianl Image')
subplot(2,2,3);imshow(image_back,[]);title('image Back')
subplot(2,2,4);imshow(image_obj,[]);title('image Obj')


                                                                                                 
% **************************************************************************



% for i=2:1:M-1;
%     for j=2:1:N-1;
%         if p(i,j) <128
%             nb(i,j) = nb(i,j)+1;
%             sb(i,j) = sb(i,j) + p(i,j);
%         else
%             no(i,j) = no(i,j)+1;
%             so(i,j) = so(i,j) + p(i,j);
%             
%     end
% end

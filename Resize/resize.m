function Signal = resize(data1, NewL)

old = length(data1);
y = zeros(1,NewL);
ratio = old / NewL;
f = ceil(NewL /old);

for i=1:NewL-f
    j = ceil(i*ratio);
    W = i*ratio - j+1;
    if j ~= length(data1)
        y(1,i) = (data1(j)) * (1-W)+(data1(j+1))* W;
    elseif j == length(data1);
        y(1,j) = y(1,i-1);
    end
end

for i=1:f
    y(NewL-i) = data1(old);
end


Signal = y;


% img = imread('1.jpg');
% [M,N]=size(image);
% global p;
% global l;
% 
% p = input('enter the x size: ');
% l = input('enter the y size: ');
% 
%  new = zeros(p, l);
% n = M./p;
% f = round(1./n);
% 
% for i=1:N-1
%     for j=1:p-f-1
%         k = fix( j*n);
%         wx = j*n -k;
%         arr(i,j) = fix(M(i,k) * (1-wx) + M(i, k+1)*wx);
%        
%     end
%     arr(i,p-1-j) = M(i, M-1);
% end
% 
% nn = N./l;
% ff = round(1./nn);
% 
% for i=1:p-1
%     for j=1:l-ff-1
%         
%         k = fix( j*n);
%         wx = j*n -k;
%         arr2(i,j) = fix(M(i,k) * (1-wx) + M(i, k+1)*wx);
%         
%     end
%     arr2(l-1-ff,i) = M(i, M-1);
%         
% end
% 
% a = zeros(arr, arr2);
% 
% imshow(a);








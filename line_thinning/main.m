close all;
clear all;


global ibw
global image_skelet
global M
global N

%-----------------------------
image=imread('2.bmp');
[M,N,Z]=size(image);

%convert image to binarry

ibw = binary(image);

% ibw = image;
% for i=1:1:k-1
%  for j=1:1:z-1
%      if (ibw(i,j) > 128)
%          ibw(i,j) = 1;
%      elseif (ibw(i,j) < 128)
%          ibw(i,j) = 0;
%      end
%      
%  end
% end
      

%init-----------------------------------------------------------
image_skelet=ibw;
image_src=ibw;

image_skelet(1,:)=0;
image_skelet(M-1,:)=0;
image_skelet(:,1)=0;
image_skelet(:,N-1)=0;

im_size=M*N;

%call ln_thin------------------------------------

   fn_ln_thin(ibw,image_skelet);  

%plot------------------------------------------
figure('name','Line-Thinning')
subplot(1,2,1);imshow(image_src,[]);title('Src-image')
subplot(1,2,2);imshow(image_skelet,[]);title('image-Line-thining')




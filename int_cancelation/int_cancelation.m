close all;
clear all;

%-------------------------------------------------

image=double(imread('1.jpg'));
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

im_sum = R+G+B;
[r,h,z]=size(image);

red_chnl = R./im_sum;
green_chnl = G./im_sum;
blue_chnl = B./im_sum;

%Normalized---------------------------------------------------
im_color_funder(:,:,1)=red_chnl*255;
im_color_funder(:,:,2)=green_chnl*255;
im_color_funder(:,:,3)=blue_chnl*255;

figure()
subplot(2,1,1);imshow(uint8(image),[]);title('Src-image')
subplot(2,1,2);imshow(uint8(im_color_funder),[]);title('Int-cancelation')
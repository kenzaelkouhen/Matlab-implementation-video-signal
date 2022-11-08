% Kenza El Kouhen  Group 11
% SSMM Lab 3.1 
% Test_2_2.m 

%Read the image 'PeppersRGB.bmp’ from file. 
im= imread('PeppersRGB.bmp');
%Convert the RGB image to YCbCr 4:2:0 and back to RGB using testing the 'nearest’, the ‘bilinear’ and ‘bicubic’ interpolation methods for the ‘imresize’ function. • 
ycbcr = RGBtoYCbCr(im);
ycbcr4201= conv444to420(ycbcr,'nearest'); %444 to 420
ycbcr4202= conv444to420(ycbcr,'bilinear');
ycbcr4203= conv444to420(ycbcr,'bicubic');
ycbcr4441= conv420to444(ycbcr4201,'nearest'); %420 to 444
ycbcr4442= conv420to444(ycbcr4202,'bilinear');
ycbcr4443= conv420to444(ycbcr4203,'bicubic');
rgb1= YCbCrtoRGB(ycbcr4441); %back to rgb
rgb2= YCbCrtoRGB(ycbcr4442);
rgb3= YCbCrtoRGB(ycbcr4443);

%Display the reconstructed and original images for visual comparison. 
figure (1)
subplot(1,2,1); imshow(im); title('original');
subplot(1,2,2); imshow(rgb1);title('nearest reconstruction');

figure (2)
subplot(1,2,1); imshow(im); title('original');
subplot(1,2,2); imshow(rgb2);title('bilinear reconstruction');

figure (3)
subplot(1,2,1); imshow(im); title('original');
subplot(1,2,2); imshow(rgb3);title('bicubic reconstruction');


%Compute and print the PSNR value for each interpolation method. 
psnrR1 = psnr(rgb1,im);
fprintf('The psnr value for nearest is:%f\n',psnrR1);
psnrR2 = psnr(rgb2,im);
fprintf('The psnr value for bilinear is:%f\n',psnrR2);
psnrR3 = psnr(rgb3,im);
fprintf('The psnr value for bicubic is:%f\n',psnrR3);


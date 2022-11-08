% Kenza El Kouhen  Group 11
% SSMM Lab 3.1 
% Test_1_2.m 

%Read an image 
imRGB = imread('PeppersRGB.bmp');
%imRGB = imread('barrasRGB.bmp');

%Convert to YCbCr using the implemented function 
imYCbCr = RGBtoYCbCr(imRGB);

%Reconstruct the RGB image using the implemented function
RecRGB = YCbCrtoRGB(imYCbCr);

%Display the original RGB image and the reconstructed one
subplot(1,2,1); imshow(imRGB); title ('original');
subplot(1,2,2); imshow(RecRGB); title ('reconstructed');

%Compare the original and reconstructed RGB images using the PSNR function. 
psnrR = psnr(imRGB, RecRGB);
%Print its value 
fprintf('The psnr value is:%f\n',psnrR); 

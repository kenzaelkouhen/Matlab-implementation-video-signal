% Kenza El Kouhen Group 11
% SSMM Lab 3.1 
% Test_2_1.m 

%Read the image ‘PeppersRGB.bmp’ from file
im= imread('PeppersRGB.bmp');
%Convert the original RGB image to YCbCr 4:2:2 format using the functions implemented
ycbcr = RGBtoYCbCr(im);
ycbcr422= conv444to422(ycbcr);
%Reconstruct back the image in RGB format
ycbcr444= conv422to444(ycbcr422);
rgb = YCbCrtoRGB(ycbcr444);
%Display the original RGB image and the reconstructed RGB image
figure(1)
subplot(1,2,1); imshow(im); title('original');
subplot(1,2,2); imshow(rgb); title('reconstruida');
%Compute and print the PSNR of the reconstructed image
psnrR = psnr(rgb,im);
fprintf('The psnr value is:%f\n',psnrR); 
%Now convert the original RGB image to YCbCr 4:2:0 format
ycbcr420= conv444to420(ycbcr,'nearest');
%Reconstruct back the image in RGB format
ycbcr444R= conv420to444(ycbcr420,'nearest');
rgbR = YCbCrtoRGB(ycbcr444R);
%Display the reconstructed RGB image
figure(2)
subplot(1,2,1); imshow(im); title('original');
subplot(1,2,2); imshow(rgbR); title('reconstruida');
%Compute and print the PSNR of this new reconstructed image
psnrRR = psnr(rgbR,im);
fprintf('The psnr value is:%f\n',psnrRR);


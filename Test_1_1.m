% Kenza El Kouhen Group 11
% SSMM Lab 3.1 
% Test_1_1.m 

%Read an image 
imRGB = imread('PeppersRGB.bmp');
%imRGB = imread('barrasRGB.bmp');

%Display the original image 
figure (1)
subplot(2,2,1); imshow(imRGB); title ('original image');
%and each one of the three image color planes (R, G, B)
PR= imRGB(:,:,1);
PG= imRGB(:,:,2);
PB= imRGB(:,:,3);

subplot(2,2,2); imshow(PR); title ('color plane R');
subplot(2,2,3); imshow(PG); title ('color plane G');
subplot(2,2,4); imshow(PB); title ('color plane B');

%Form a new RGB image swapping the color planes in a different order
imSW(:,:,1)= PG;
imSW(:,:,2)= PB;
imSW(:,:,3)= PR;
%Display this image
figure (2)
subplot(1,2,1); imshow(imRGB); title ('original image');
subplot(1,2,2); imshow(imSW); title ('RGB image swapped');


% Kenza El Kouhen Group 11
% SSMM Lab 3.1 
% YCbCrtoRGB

function [imageRGB] = YCbCrtoRGB(YCbCr) 

% First, we obtain the containers of the input cell, Y Cb Cr
Y = YCbCr{1};
Cb = YCbCr{2};
Cr= YCbCr{3};

% We proceed to going backwards through the needed steps in the previous function

% Obtention of re-normalized color difference signals (ECb y ECr) and luminance signal Ey
Ey = (Y - 16)/219; 
ECb = (Cb - 128)/224; 
ECr = (Cr - 128)/224;

% Obtention of the color difference signals 
Kb = 0.5643; %Coeficients needed
Kr = 0.7133;
Eby = ECb/Kb;
Ery = ECr/Kr; 

%Then, the obtention of the normalized RGB signals 
Er = Ey + Ery; 
Eg = (Ey*(1-0.299)-0.114*Eby)/0.587;
Eb = Ey + Eby; 

%We obtain the RGB signals, denormalizing 
R = im2uint8 (Er); 
G = im2uint8 (Eg); 
B = im2uint8 (Eb); 

%We obtain the resulting image in RGB format, passing the resulting signals
%to their corresponding plan in the image
imageRGB(:,:,1)= R;
imageRGB(:,:,2)= G;
imageRGB(:,:,3)= B;

end 


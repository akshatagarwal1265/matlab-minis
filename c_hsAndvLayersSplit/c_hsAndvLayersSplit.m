%Splitting Input Image into its HS(Color) and V(Greyscale) Components

%Initialization
clear; close all; clc;

%Getting Acceptable Image File from User Via Dialog Box
[FileName,PathName]=uigetfile({'*.jpg;*.jpeg;*.png;*.tif','Acceptable Types'},...
    'Select the "jpg", "jpeg", "png" or "tif" file to be split:');
FullName=fullfile(PathName,FileName);
if isequal(FileName,0)
    disp('Selection Cancelled')
    return;
else
    disp(FullName)
end

%Read input file
im = imread(FullName);

%Convert RGB to HSV format and store in both hsv1 & hsv2
hsv1 = rgb2hsv(im);
hsv2 = hsv1;

%Array of Ones and Zeros for using as defaults in HSV channels
ones2D = ones(size(im(:,:,1)));
zeros2D = zeros(size(im(:,:,1)));


%1ST IMAGE - GRAYSCALE

%1st image, Greyscale, only V component preserved, H and S discarded
%H channel replaced by all Ones, S replaced by all Zeros, Hence Gray
hsv1(:,:,1)=ones2D;
hsv1(:,:,2)=zeros2D;

%1st image, Converted back to RGB
rgb1 = hsv2rgb(hsv1);


%2ND IMAGE - COLOR

%2nd image, Color, HS components preserved
%V channel replaced by all Ones, Hence Brightest
hsv2(:,:,3) = ones2D;

%2nd image, Converted back to RGB
rgb2 = hsv2rgb(hsv2);


%DISPLAY

%Full Screen FIGURE Window
figure('units','normalized','outerposition',[0 0 1 1]);

%Display subPlot of Grayscale Component (H=1, S=0, V=V)
subplot(1,2,1); imshow(rgb1); title('Grayscale -> 1-0-V');

%Display subPlot of Color Component (H=H, S=S, V=1)
subplot(1,2,2); imshow(rgb2); title('Color -> H-S-1');
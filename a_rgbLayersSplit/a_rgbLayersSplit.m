%Splitting Input Image into its RGB Components

%Initialization
clear; close all; clc;

%Getting Acceptable Image File from User Via Dialog Box
[FileName,PathName]=uigetfile({'*.jpg;*.jpeg;*.png','Acceptable Types'},...
    'Select the "jpg", "jpeg" or "png" file to be Split:');
FullName=fullfile(PathName,FileName);
if isequal(FileName,0)
    disp('Selection Cancelled')
else
    disp(FullName)

    %Read input file
    im=imread(FullName);

    %2D array of Zeros of input image dimension
    zero2D=zeros(size(im,1),size(im,2));

    %Full Screen FIGURE Window
    figure('units','normalized','outerposition',[0 0 1 1]);

    %Display subPlot of RED Component
    imRed=cat(3,im(:,:,1),zero2D,zero2D);
    subplot(2,2,1); imshow(imRed); title('RED'); 

    %Display subPlot of GREEN Component
    imGreen=cat(3,zero2D,im(:,:,2),zero2D);
    subplot(2,2,2); imshow(imGreen); title('GREEN');

    %Display subPlot of BLUE Component
    imBlue=cat(3,zero2D,zero2D,im(:,:,3));
    subplot(2,2,3); imshow(imBlue); title('BLUE');

    %Display subPlot of ORIGINAL IMAGE
    subplot(2,2,4); imshow(im); title('ORIGINAL IMAGE');
end
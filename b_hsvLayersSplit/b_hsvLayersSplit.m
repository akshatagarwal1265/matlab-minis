%Splitting Input Image into its HSV Components

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
    
    %Convert RGB to HSV format
    %NOTE: HSV has each pixel within 0 to 1 for each component H,S,V
    %Hue        -> 0 to 1 = colors vary from red through yellow, 
    %                       green, cyan, blue, magenta, and back to red
    %Saturation -> 0 to 1 = unsaturated (or neutral or shades of
    %                       gray) to saturated (or no white component)
    %Value      -> 0 to 1 = brightness or luminance increases
    HSV=rgb2hsv(im);
    
    %2D array of Ones of input image dimension
    %Since array of ones is taken,
    %HSV default will be -> Red Hue, Max Saturation, Max Brightness
    ones2D=ones(size(im,1),size(im,2));
    
    %Hue Component, with Max Saturation & Max Brightness, in RGB
    H=hsv2rgb(cat(3,HSV(:,:,1),ones2D,ones2D));
    
    %Saturation Component, with Red Hue & Max Brightness, in RGB
    S=hsv2rgb(cat(3,ones2D,HSV(:,:,2),ones2D));
    
    %Value Component, with Red Hue & Max Saturation, in RGB
    V=hsv2rgb(cat(3,ones2D,ones2D,HSV(:,:,3)));
    
    %Full Screen FIGURE Window
    figure('units','normalized','outerposition',[0 0 1 1]);
    
    %Display subPlot of Hue Component
    subplot(2,2,1); imshow(H); title('Hue');
    
    %Display subPlot of Saturation Component
    subplot(2,2,2); imshow(S); title('Saturation');
    
    %Display subPlot of Value Component
    subplot(2,2,3); imshow(V); title('Value');
    
    %Display subPlot of ORIGINAL IMAGE
    subplot(2,2,4); imshow(im); title('ORIGINAL IMAGE');
end
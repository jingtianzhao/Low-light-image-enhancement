clear all
close all
clc
warning off
addpath D:\work\matlab_code\Brain-like-Retinex-main\
addpath D:\work\matlab_code\image-enhancement-about-Retinex-master\
addpath D:\work\matlab_code\LIME-master\
addpath D:\work\matlab_code\Low-light-image-enhancement-master\
addpath D:\work\matlab_code\MSRetinex\
addpath D:\work\matlab_code\Retinex-Based-Multiphase-Algorithm-for-Low-Light-Image-Enhancement-main\
addpath D:\work\matlab_code\STAR-TIP2020-master\
addpath D:\work\matlab_code\Function\
addpath D:\work\matlab_code\Brain-like-Retinex-main\image\
addpath D:\work\matlab_code\benchmark\
addpath D:\work\matlab_code\benchmark\VIFutils\
addpath D:\work\matlab_code\benchmark\VIFutils\matlabPyrTools-master\
addpath D:\work\matlab_code\benchmark\VIFutils\matlabPyrTools-master\TUTORIALS\
addpath D:\work\matlab_code\benchmark\VIFutils\matlabPyrTools-master\MEX\
addpath D:\work\matlab_code\WVM\
addpath D:\work\matlab_code\BIMEF-master\
addpath D:\work\dataset\MEF\
addpath D:\work\dataset\LIME\
addpath D:\work\dataset\ExDark\
addpath D:\work\dataset\NPE\
addpath D:\work\dataset\LOLdataset\our485\low\
addpath D:\work\dataset\LOLdataset\eval15\low\
addpath D:\work\dataset\ExDark\Bicycle\
addpath D:\work\dataset\ExDark\Cat\
addpath D:\work\dataset\ExDark\Boat\
addpath D:\work\dataset\ExDark\Bus\
addpath D:\work\dataset\ExDark\Dog\
addpath D:\work\dataset\ExDark\Table\
addpath D:\work\dataset\LSRW\Huawei\low\
%% 
img_or=imread('01.jpg');
% img_or=imresize(img_or,[321,481]);
img=imnoise(img_or,'salt & pepper',0.1);
% img=imnoise(img_or,'gaussian',0,0.1);
% img=imnoise(img_or,'speckle',0.01);
% img=img_or;
%%
img_name='01';
noise_type='salt';
% noise_type='gaussian';
% noise_type='speckle';
% noise_type='nonoise';
noise_level='4';
algorithm=["original","LIME","STAR","RBMP","WVM","BIMEF","RRM","brain","proposed"];
%% Proposed
alpha = 0.0001;
beta = 0.001; 
vareps=0.0001;
[L, R_new, N1,out_ours_1] = out_improved3(img, alpha, beta, 20, vareps,2.2,1.4);
figure
imshow(R_new)
%% ÏÔÊ¾Í¼Ïñ
out_ours=out_ours_1*255;
figure
imshow(uint8(out_ours)) %
%% ±£´æÍ¼Ïñ
imwrite(uint8(out_ours),[img_name,noise_type,noise_level,char(algorithm(9)),'.png']);
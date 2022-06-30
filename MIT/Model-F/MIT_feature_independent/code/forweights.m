
clear;
clc;

file=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/train_inception_4a_forweights_mat.mat');
data=file.data;

data1=data(:,1);
data1=data1';

data2=reshape(data1,[512,196]);

data3=data2(1,:);

img=reshape(data3,[14,14]);

img2=imresize(img,[64,64]);

img3=im2uint16(img2);

imshow(img2);
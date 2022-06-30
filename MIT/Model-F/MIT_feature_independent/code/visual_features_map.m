

clear;
clc;

file=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/features_map2/conv2_mat');
data=file.data;
savedir='/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/code/contour_fig_feature_map2/';

%images=reshape(data,[12544,64]); %conv1
images=reshape(data,[3136,64]); %conv2
%images=reshape(data,[3136,64]); %conv3
images=images';

for i=1:64
    image1=images(i,:);
     
    
    %imgtmp=reshape(image1,[112,112]); %conv1
    imgtmp=reshape(image1,[56,56]); %conv2
    %imgtmp=reshape(image1,[56,56]); %conv3
    
    imgtmp=imrotate(imgtmp,-90);
    imgtmp=imgtmp(:,end:-1:1);
    
    contourf(imgtmp);
    
    saveas(gcf,[savedir,num2str(i),'.jpg']);
    
    
    
    %imgtmp=imresize(imgtmp,[112,112]);
    
    
    
    %j=mod(i,8);
   % k=ceil(i/8);
    
   
    %subplot('position',[(j*100)/(8*112),1-(k*112)/(8*112),112/(9*112),112/(9*112)]);imshow(imgtmp,[]);
       
    %hold on
    
    %imwrite(imgtmp,[savedir,num2str(i),'.jpg']);
end


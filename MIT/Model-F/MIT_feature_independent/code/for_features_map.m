
clear;
clc;

file=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/features_map2/conv3_mat');
data=file.data;
savedir='/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/features_map2/conv3/';

images=reshape(data,[3136,192]);
images=images';

for i=1:64
    image1=images(i,:);
    imgtmp=reshape(image1,[56,56]);
    imgtmp=imrotate(imgtmp,-90);
    imgtmp=imgtmp(:,end:-1:1);
    
    imwrite(imgtmp,[savedir,num2str(i),'.jpg']);
end



    
    
    
    
    
    
    
    
    
    

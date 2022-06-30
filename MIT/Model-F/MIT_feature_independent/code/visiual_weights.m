
clear;
clc;

%kLayerIndConv1=1;
%kLayerIndConv3=6;
kProtoFilePath='/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/deploy.prototxt';
kModelFilePath='/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/MIT_iter_30000.caffemodel';

caffeNet=caffe.Net(kProtoFilePath,kModelFilePath,'test');

%convweights1=caffeNet.layer_vec(kLayerIndConv1).params(1).get_data();
%convbias1=caffeNet.layer_vec(kLayerIndConv1).params(2).get_data();

convweights=caffeNet.layer_vec(7).params(1).get_data();
convbias=caffeNet.layer_vec(7).params(2).get_data();

[w,h,in,out]=size(convweights);

for i=1:64
    wmap=convweights(:,:,3,i);
    
    contourf(wmap);
    
    saveas(gcf,['/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/code/contour_conv3_fig3/',num2str(i),'.jpg']);
    
    %rewmap=imresize(wmap,[128,128]);
    
    
    
    %subplot(8,8,i);imshow(rewmap,[]);

    %subplot('Position',[0.02,0.8,)
end
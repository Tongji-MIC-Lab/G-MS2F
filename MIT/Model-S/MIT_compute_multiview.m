clear;
clc;

[testimgpath,testlabels]=textread('/home/tj/tpj/mltask/MIT/testdata_MIT_256_list_addpre.txt','%s %d');
multi_file='/home/tj/tpj/mltask/MIT/MIT_googlenet_place205_withpre_relu/';
savedir='/home/tj/tpj/mltask/MIT/code/';


scale322_center_1=load([multi_file,'outfile__iter_30000_1_center']);
scale322_center_m_1=load([multi_file,'outfile__iter_30000_1_center_m']);
scale322_left_bottom_1=load([multi_file,'outfile__iter_30000_1_left_bot_corner']);
scale322_left_bottom_m_1=load([multi_file,'outfile__iter_30000_1_left_bot_corner_m']);
scale322_left_top_1=load([multi_file,'outfile__iter_30000_1_left_top_corner']);
scale322_left_top_m_1=load([multi_file,'outfile__iter_30000_1_left_top_corner_m']);
scale322_right_bottom_1=load([multi_file,'outfile__iter_30000_1_right_bot_corner']);
scale322_right_bottom_m_1=load([multi_file,'outfile__iter_30000_1_right_bot_corner_m']);
scale322_right_top_1=load([multi_file,'outfile__iter_30000_1_right_top_corner']);
scale322_right_top_m_1=load([multi_file,'outfile__iter_30000_1_right_top_corner_m']);

average1=[];
%fenmuarr=[];
%fenmu=((((((((scale322_center_1.*scale322_center_m_1).*scale322_left_bottom_1).*scale322_left_bottom_m_1).*scale322_left_top_1).*scale322_left_top_m_1).*scale322_right_bottom_1).*scale322_right_bottom_m_1).*scale322_right_top_1).*scale322_right_top_m_1;
%[mfenmu,nfenmu]=size(fenmu);
%for i=1:mfenmu
%    fenmutmp=sum(fenmu(i,:));
%    fenmuarr(end+1)=sum(fenmu(i,:));
%    average1(i,:)=fenmu(i,:)/fenmutmp;
%end

average1=(scale322_center_1+scale322_center_m_1+scale322_left_bottom_1+scale322_left_bottom_m_1+scale322_left_top_1+scale322_left_top_m_1+scale322_right_bottom_1+scale322_right_bottom_m_1+scale322_right_top_1+scale322_right_top_m_1)/10;
%average1=scale322_center_1;

scale322_center_2=load([multi_file,'outfile__iter_30000_2_center']);
scale322_center_m_2=load([multi_file,'outfile__iter_30000_2_center_m']);
scale322_left_bottom_2=load([multi_file,'outfile__iter_30000_2_left_bot_corner']);
scale322_left_bottom_m_2=load([multi_file,'outfile__iter_30000_2_left_bot_corner_m']);
scale322_left_top_2=load([multi_file,'outfile__iter_30000_2_left_top_corner']);
scale322_left_top_m_2=load([multi_file,'outfile__iter_30000_2_left_top_corner_m']);
scale322_right_bottom_2=load([multi_file,'outfile__iter_30000_2_right_bot_corner']);
scale322_right_bottom_m_2=load([multi_file,'outfile__iter_30000_2_right_bot_corner_m']);
scale322_right_top_2=load([multi_file,'outfile__iter_30000_2_right_top_corner']);
scale322_right_top_m_2=load([multi_file,'outfile__iter_30000_2_right_top_corner_m']);

average2=[];
%fenmuarr=[];
%fenmu=((((((((scale322_center_2.*scale322_center_m_2).*scale322_left_bottom_2).*scale322_left_bottom_m_2).*scale322_left_top_2).*scale322_left_top_m_2).*scale322_right_bottom_2).*scale322_right_bottom_m_2).*scale322_right_top_2).*scale322_right_top_m_2;
%[mfenmu,nfenmu]=size(fenmu);
%for i=1:mfenmu
%    fenmutmp=sum(fenmu(i,:));
%    fenmuarr(end+1)=sum(fenmu(i,:));
%    average2(i,:)=fenmu(i,:)/fenmutmp;
%end

average2=(scale322_center_2+scale322_center_m_2+scale322_left_bottom_2+scale322_left_bottom_m_2+scale322_left_top_2+scale322_left_top_m_2+scale322_right_bottom_2+scale322_right_bottom_m_2+scale322_right_top_2+scale322_right_top_m_2)/10;
%average2=scale322_center_2;

scale322_center_3=load([multi_file,'outfile__iter_30000_3_center']);
scale322_center_m_3=load([multi_file,'outfile__iter_30000_3_center_m']);
scale322_left_bottom_3=load([multi_file,'outfile__iter_30000_3_left_bot_corner']);
scale322_left_bottom_m_3=load([multi_file,'outfile__iter_30000_3_left_bot_corner_m']);
scale322_left_top_3=load([multi_file,'outfile__iter_30000_3_left_top_corner']);
scale322_left_top_m_3=load([multi_file,'outfile__iter_30000_3_left_top_corner_m']);
scale322_right_bottom_3=load([multi_file,'outfile__iter_30000_3_right_bot_corner']);
scale322_right_bottom_m_3=load([multi_file,'outfile__iter_30000_3_right_bot_corner_m']);
scale322_right_top_3=load([multi_file,'outfile__iter_30000_3_right_top_corner']);
scale322_right_top_m_3=load([multi_file,'outfile__iter_30000_3_right_top_corner_m']);

average3=[];
%fenmuarr=[];
%fenmu=((((((((scale322_center_3.*scale322_center_m_3).*scale322_left_bottom_3).*scale322_left_bottom_m_3).*scale322_left_top_3).*scale322_left_top_m_3).*scale322_right_bottom_3).*scale322_right_bottom_m_3).*scale322_right_top_3).*scale322_right_top_m_3;
%[mfenmu,nfenmu]=size(fenmu);
%for i=1:mfenmu
%    fenmutmp=sum(fenmu(i,:));
%    fenmuarr(end+1)=sum(fenmu(i,:));
 %   average3(i,:)=fenmu(i,:)/fenmutmp;
%end

average3=(scale322_center_3+scale322_center_m_3+scale322_left_bottom_3+scale322_left_bottom_m_3+scale322_left_top_3+scale322_left_top_m_3+scale322_right_bottom_3+scale322_right_bottom_m_3+scale322_right_top_3+scale322_right_top_m_3)/10;
%average3=scale322_center_3;
%values1=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/values1.mat');
%values1=values1.values;
%values2=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/values2.mat');
%values2=values2.values;
%values3=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/values3.mat');
%values3=values3.values;
%values_fusion=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/values_fusion.mat');
%values_fusion=values_fusion.values;

%values=(values1+values2+values3+values_fusion)/4;

%average=average1+average2+average3;
%fenmuarr=[];
fenzi=(average1.*average2).*average3;
[mfenzi,nfenzi]=size(fenzi);
for i=1:mfenzi
    fenmutmp=sum(fenzi(i,:));
    %fenmuarr(end+1)=sum(fenzi(i,:));
    average(i,:)=fenzi(i,:)./fenmutmp;
end
averagetmp=average;
%average=average3;

save([savedir,'averagetmp'],'averagetmp');
save([savedir,'average1'],'average1');
save([savedir,'average2'],'average2');
save([savedir,'average3'],'average3');

%average=values1;
%save([multi_file,'average256'],'average256');
%average=scale322_center+scale322_center_m;


[m,n]=size(average);
correctnum1=0;
correctnum2=0;

for i=1:m
    [predicevalue1(i,1),predictlabel1(i,1)]=max(average(i,:));
    average(i,predictlabel1(i,1))=min(average(i,:));
    %predictlabel1(i,1)=predictlabel1(i,1)-1;
    
    [predicevalue2(i,1),predictlabel2(i,1)]=max(average(i,:));
    average(i,predictlabel2(i,1))=min(average(i,:));
    %predictlabel2(i,1)=predictlabel2(i,1)-1;
    
    [predicevalue3(i,1),predictlabel3(i,1)]=max(average(i,:));
    average(i,predictlabel3(i,1))=min(average(i,:));
    %predictlabel3(i,1)=predictlabel3(i,1)-1;
    
    [predicevalue4(i,1),predictlabel4(i,1)]=max(average(i,:));
    average(i,predictlabel4(i,1))=min(average(i,:));
    %predictlabel4(i,1)=predictlabel4(i,1)-1;
    
    [predicevalue5(i,1),predictlabel5(i,1)]=max(average(i,:));
    average(i,predictlabel5(i,1))=min(average(i,:));
    %predictlabel5(i,1)=predictlabel5(i,1)-1;
    
    
end

for i=1:m
    if (predictlabel1(i,1)-1)==testlabels(i,1)
        correctnum1=correctnum1+1;
    end
end

for i=1:m
    if (predictlabel1(i,1)-1)==testlabels(i,1) || (predictlabel2(i,1)-1)==testlabels(i,1) || (predictlabel3(i,1)-1)==testlabels(i,1) || (predictlabel4(i,1)-1)==testlabels(i,1) || (predictlabel5(i,1)-1)==testlabels(i,1)
        correctnum2=correctnum2+1;
    end
end

accuracy1=correctnum1/m;
accuracy2=correctnum2/m;
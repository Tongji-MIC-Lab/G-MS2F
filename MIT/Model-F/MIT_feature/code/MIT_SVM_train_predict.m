
clear;
clc;

traindata1_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/train_loss1_fc_20000_mat');
traindata1_tmp=traindata1_tmp.data;
testdata1_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/test_loss1_fc_20000_mat');
testdata1_tmp=testdata1_tmp.data;

traindata1_tmp=double(traindata1_tmp');
testdata1_tmp=double(testdata1_tmp');

[mtrain1,ntrain1]=size(traindata1_tmp);
[mtest1,ntest1]=size(testdata1_tmp);

traindata1=[];
testdata1=[];
for i=1:mtrain1
    tnorm=norm(traindata1_tmp(i,:),2);
    traindata1(end+1,:)=traindata1_tmp(i,:)./tnorm;
end

for i=1:mtest1
    tnorm=norm(testdata1_tmp(i,:),2);
    testdata1(end+1,:)=testdata1_tmp(i,:)./tnorm;
end

traindata2_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/train_loss2_fc_20000_mat');
traindata2_tmp=traindata2_tmp.data;
testdata2_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/test_loss2_fc_20000_mat');
testdata2_tmp=testdata2_tmp.data;

traindata2_tmp=double(traindata2_tmp');
testdata2_tmp=double(testdata2_tmp');

[mtrain2,ntrain2]=size(traindata2_tmp);
[mtest2,ntest2]=size(testdata2_tmp);

traindata2=[];
testdata2=[];
for i=1:mtrain2
    tnorm=norm(traindata2_tmp(i,:),2);
    traindata2(end+1,:)=traindata2_tmp(i,:)./tnorm;
end

for i=1:mtest2
    tnorm=norm(testdata2_tmp(i,:),2);
    testdata2(end+1,:)=testdata2_tmp(i,:)./tnorm;
end

traindata3_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/train_pool5_20000_mat');
traindata3_tmp=traindata3_tmp.data;
testdata3_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/test_pool5_20000_mat');
testdata3_tmp=testdata3_tmp.data;

traindata3_tmp=double(traindata3_tmp');
testdata3_tmp=double(testdata3_tmp');

[mtrain3,ntrain3]=size(traindata3_tmp);
[mtest3,ntest3]=size(testdata3_tmp);

traindata3=[];
testdata3=[];
for i=1:mtrain3
    tnorm=norm(traindata3_tmp(i,:),2);
    traindata3(end+1,:)=traindata3_tmp(i,:)./tnorm;
end

for i=1:mtest3
    tnorm=norm(testdata3_tmp(i,:),2);
    testdata3(end+1,:)=testdata3_tmp(i,:)./tnorm;
end


%traindata=[traindata1_tmp,traindata2_tmp,traindata3_tmp];
%testdata=[testdata1_tmp,testdata2_tmp,testdata3_tmp];

traindata=[traindata1,traindata2,traindata3];
testdata=[testdata1,testdata2,testdata3];

%traindata=[traindata3_tmp];
%testdata=[testdata3_tmp];

%traindata1=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/train_loss1_fc_20000_mat');
%traindata1=traindata1.data;
%testdata1=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/test_loss1_fc_20000_mat');
%testdata1=testdata1.data;

%traindata2=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/train_loss2_fc_20000_mat');
%traindata2=traindata2.data;
%testdata2=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/test_loss2_fc_20000_mat');
%testdata2=testdata2.data;

%traindata3=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/train_pool5_20000_mat');
%traindata3=traindata3.data;
%testdata3=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/test_pool5_20000_mat');
%testdata3=testdata3.data;

%traindata3=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/loss1_fc_train_mat');
%traindata3=traindata3.data;
%testdata3=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature/loss1_fc_test_mat');
%testdata3=testdata3.data;

%traindata=[traindata1+traindata2+traindata3]/3;
%testdata=[testdata1+testdata2+testdata3]/3;


%fenmuarr=[];
%fenmu=(traindata1.*traindata2).*traindata3;
%[mfenmu,nfenmu]=size(fenmu);
%for i=1:mfenmu
%    fenmutmp=sum(fenmu(i,:));
%    fenmuarr(end+1)=sum(fenmu(i,:));
%    traindatat(i,:)=fenmu(i,:)/fenmutmp;
%end
%traindata=traindatat;


%fenmuarr=[];
%fenmu=(testdata1.*testdata2).*testdata3;
%[mfenmu,nfenmu]=size(fenmu);
%for i=1:mfenmu
%    fenmutmp=sum(fenmu(i,:));
%    fenmuarr(end+1)=sum(fenmu(i,:));
%    testdatat(i,:)=fenmu(i,:)/fenmutmp;
%end
%testdata=testdatat;
%traindata=[traindata3];
%testdata=[testdata3];

trainlist='/home/tj/newdisk/tpj/feature_extraction/MIT_feature/traindata_MIT_256_list_addpre.txt';
testlist='/home/tj/newdisk/tpj/feature_extraction/MIT_feature/testdata_MIT_256_list_addpre.txt';
[trainpath,trainlabel]=textread(trainlist,'%s %d');
[testpath,testlabel]=textread(testlist,'%s %d');

%traindata=double(traindata');
%testdata=double(testdata');

%traindata=(sqrt(traindata));
%testdata=(sqrt(testdata));

%traindata=cos(traindata);
%testdata=cos(testdata);
%traindata=traindata.^(1/3);
%testdata=testdata.^(1/3);

traindata=traindata.^(1/2);
testdata=testdata.^(1/2);

ktrain1=traindata*traindata';
Ktrain1=[(1:5360)',ktrain1];
model=svmtrain(trainlabel,Ktrain1,'-t 4 -b 1');

ktest1=testdata*traindata';
Ktest1=[(1:1340)',ktest1];
[predictlabel,accuracy,values]=svmpredict(testlabel,Ktest1,model);


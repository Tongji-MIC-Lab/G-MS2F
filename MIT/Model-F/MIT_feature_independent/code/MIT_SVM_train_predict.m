
clear;
clc;

savedir='/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/';

traindata1_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/train_loss1_classifier_mat');
traindata1_tmp=traindata1_tmp.data;
testdata1_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/test_loss1_classifier_mat');
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

traindata2_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/train_loss2_classifier_mat');
traindata2_tmp=traindata2_tmp.data;
testdata2_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/test_loss2_classifier_mat');
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

traindata3_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/train_loss3_classifier_mat');
traindata3_tmp=traindata3_tmp.data;
testdata3_tmp=load('/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/test_loss3_classifier_mat');
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


%traindata=[traindata1;traindata2;traindata3];
%testdata=[testdata1;testdata2;testdata3];

traindata=[traindata1,traindata2,traindata3];
testdata=[testdata1,testdata2,testdata3];

traindata=[traindata3];
testdata=[testdata3];

trainlist='/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/traindata_MIT_256_list_addpre.txt';
testlist='/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/testdata_MIT_256_list_addpre.txt';
[trainpath,trainlabel]=textread(trainlist,'%s %d');
[testpath,testlabel]=textread(testlist,'%s %d');

%traindata_tmp=double(traindata');
%testdata_tmp=double(testdata');

%[mtrain,ntrain]=size(traindata_tmp);
%[mtest,ntest]=size(testdata_tmp);

%traindata=[];
%testdata=[];
%for i=1:mtrain
%    tnorm=norm(traindata_tmp(i,:),2);
%    traindata(end+1,:)=traindata_tmp(i,:)./tnorm;
%end

%for i=1:mtest
%    tnorm=norm(testdata_tmp(i,:),2);
%    testdata(end+1,:)=testdata_tmp(i,:)./tnorm;
%end



%traindata=cos(traindata_tmp);
%testdata=cos(testdata_tmp);
%traindata=traindata.^(1/3);
%testdata=testdata.^(1/3);

traindata=traindata.^(1/2);
testdata=testdata.^(1/2);



ktrain1=traindata*traindata';
Ktrain1=[(1:5360)',ktrain1];
model=svmtrain(trainlabel,Ktrain1,'-t 4 -b 1');

ktest1=testdata*traindata';
Ktest1=[(1:1340)',ktest1];
[predictlabel,accuracy,values]=svmpredict(testlabel,Ktest1,model,'-b 1');
save([savedir,'values1'],'values');


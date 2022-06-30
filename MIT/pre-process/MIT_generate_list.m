
clear;
clc;

savedir='/home/tj/tpj/mltask/MIT/';
trainrootdir='/home/tj/tpj/mltask/MIT/MIT_train_img_256/';
testrootdir='/home/tj/tpj/mltask/MIT/MIT_test_img_256/';

fidtrain=fopen([savedir,'traindata_MIT_256_list_addpre.txt'],'w');
fidtest=fopen([savedir,'testdata_MIT_256_list_addpre.txt'],'w');

[trainname,trainlabel]=textread([savedir,'traindata_MIT_256.txt'],'%s %d');
[testname,testlabel]=textread([savedir,'testdata_MIT_256.txt'],'%s %d');

[mtrain,ntrain]=size(trainlabel);

for i=1:mtrain
    fprintf('now is disposing the %d/%d the train record!\n',i,mtrain);
    trainpath=[trainrootdir,trainname{i}];
    fprintf(fidtrain,'%s\n',[trainpath,' ',num2str(trainlabel(i))]);
end

[mtest,ntest]=size(testlabel);

for i=1:mtest
    fprintf('now is disposing the %d/%d the test record!\n',i,mtest);
    testpath=[testrootdir,testname{i}];
    fprintf(fidtest,'%s\n',[testpath,' ',num2str(testlabel(i))]);
end

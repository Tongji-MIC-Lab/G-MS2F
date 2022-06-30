clear;
clc;
imgroot='/home/tj/tpj/mltask/MIT-SCENE/';
%imgdir1=dir(imgroot);


savedirtrain='/home/tj/tpj/mltask/MIT/MIT_train_img_256';
savedirtest='/home/tj/tpj/mltask/MIT/MIT_test_img_256';
train_test_dir='/home/tj/tpj/mltask/MIT/';
%data=[];
%labels=[];
   
fidtrain=fopen([train_test_dir,'traindata_MIT_256.txt'],'w');
fidtest=fopen([train_test_dir,'testdata_MIT_256.txt'],'w');

traintxtfilepath='/home/tj/tpj/mltask/MIT/TrainImages.txt';
testtxtfilepath='/home/tj/tpj/mltask/MIT/TestImages.txt';

%[trainimgpath]=textread(traintxtfilepath,'%s');
%[testimgpath]=textread(testtxtfilepath,'%s\n');

trainimgpath={};
testimgpath={};

fidopentrain=fopen(traintxtfilepath);
fidopentest=fopen(testtxtfilepath);

while ~feof(fidopentrain)
    trainimgpath{end+1,1}=fgetl(fidopentrain);
end
while ~feof(fidopentest)
    testimgpath{end+1,1}=fgetl(fidopentest);
end

mtrain=length(trainimgpath);
mtest=length(testimgpath);

imgclass={};
k=0;

for i=1:mtrain    
    ntrain=length(trainimgpath{i});
    for j=1:ntrain
        if trainimgpath{i}(1,j)=='/'
            classname=trainimgpath{i}(1,1:j-1);
            if length(imgclass)==0
                imgclass{1}=classname;
            end
            flag=0;
            for m=1:length(imgclass)
                if strcmpi(classname,imgclass{m})==1
                    flag=1;
                    break;
                end
            end
            if flag==0
                k=k+1;
                imgclass{k}=classname;
            end
          
        end
    end
end

k=0;
            
for i=1:mtrain
    fprintf('Now is disposing the %d/%dth image!\n',i,mtrain);
    ntrain=length(trainimgpath{i});
    trainimgfullpath=[imgroot,trainimgpath{i}];
    img=imread(trainimgfullpath);
    img256=imresize(img,[256,256],'bilinear'); 
    for j=1:ntrain
        if trainimgpath{i}(1,j)=='/'
            classname=trainimgpath{i}(1,1:j-1);
            imgname=trainimgpath{i}(1,j+1:ntrain);
            
            for k=1:length(imgclass)
                if strcmpi(classname,imgclass{k})==1
                    mm=length(imgname);
                    for kk=1:mm
                        if imgname(1,kk)==' '
                            imgname(1,kk)='_';
                        end
                    end
                    imwrite(img256,[savedirtrain,'/',classname,'_',imgname]);
                    fprintf(fidtrain,'%s\n',[classname,'_',imgname,' ',num2str(k-1)]);
                    break;
                end
            end
        end
    end
end
        
k=0;

for i=1:mtest
    fprintf('Now is disposing the %d/%dth image!\n',i,mtest);
    ntest=length(testimgpath{i});
    testimgfullpath=[imgroot,testimgpath{i}];
    img=imread(testimgfullpath);
    img256=imresize(img,[256,256],'bilinear'); 
    for j=1:ntest
        if testimgpath{i}(1,j)=='/'
            classname=testimgpath{i}(1,1:j-1);
            imgname=testimgpath{i}(1,j+1:ntest);
            
            for k=1:length(imgclass)
                if strcmpi(classname,imgclass{k})==1
                    mm=length(imgname);
                    for kk=1:mm
                        if imgname(1,kk)==' '
                            imgname(1,kk)='_';
                        end
                    end
                    imwrite(img256,[savedirtest,'/',classname,'_',imgname]);
                    fprintf(fidtest,'%s\n',[classname,'_',imgname,' ',num2str(k-1)]);
                    break;
                end
            end
        end
    end
end            
            
            
            
            
            

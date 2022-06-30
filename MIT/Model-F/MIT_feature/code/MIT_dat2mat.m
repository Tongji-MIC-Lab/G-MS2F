

clear;
clc;

type='single';
filename='/home/tj/newdisk/tpj/feature_extraction/MIT_feature/train_pool5_20000.dat';
savedir='/home/tj/newdisk/tpj/feature_extraction/MIT_feature/';

if ~exist('type', 'var') || isempty(type)
   type = 'single';
end
fid = fopen(filename, 'r');
rows = fread(fid, 1, type);
cols = fread(fid, 1, type);
data = fread(fid, rows * cols, type);
fclose(fid);
data = reshape(data, rows, cols);
switch type
  case 'int32'
       data = int32(data);
  case 'single'
       data = single(data); 
        
end

save([savedir,'train_pool5_20000_mat'],'data');



clear;
clc;

type='single';
filename='/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/features_map2/conv3.dat';
savedir='/home/tj/newdisk/tpj/feature_extraction/MIT_feature_2/features_map2/';

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

save([savedir,'conv3_mat'],'data');

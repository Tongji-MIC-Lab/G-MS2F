#!/usr/bin/env sh

#/home/tj/ydj_caffe/build/tools/caffe train -gpu=0 --solver=/home/tj/tpj/mltask/cal256_n60/cal256_solver.prototxt --weights=/home/tj/tpj/mltask/models-1.0.2/CNN_S/model

###/home/tj/caffe-master-aki/build/tools/caffe train -gpu=1 --solver=/home/tj/tpj/mltask/MIT/MIT_googlenet_place205_withpre_prelu/quick_solver.prototxt --weights=/home/tj/tpj/mltask/MIT/MIT_googlenet_place205_withpre_prelu/googlelet_places205_train_iter_2400000.caffemodel

#/home/tj/ydj_caffe/build/tools/caffe train -gpu=1 --solver=/home/tj/tpj/mltask/cal256_n60/cal256_solver.prototxt --weights=/home/tj/tpj/mltask/cal101_n30/cal101_model_n30/cal101_iter_45000.caffemodel

/home/tj/caffe-master-aki/build/tools/caffe multi_view_test -gpu=1 --weights=/home/tj/newdisk/tpj/MIT/MIT_models_googlenet_place205_withpre_relu_2/MIT_stage3_iter_30000.caffemodel --model=train_val_googlenet_places205_stage3.prototxt --iterations=1340 --class_num=67 --outfile_name=_iter_30000_stage3 --use_mirror=true

###/home/tj/caffe-master-aki/build/tools/caffe test -gpu=1 --weights=/home/tj/newdisk/tpj/MIT/MIT_models_googlenet_place205_withpre_relu_2/MIT_stage2_iter_20000.caffemodel --model=train_val_googlenet_places205_stage2.prototxt --iterations=1340 --class_num=67 --outfile_name=_iter_20000_test

#/home/tj/ydj_caffe/build/tools/caffe test -gpu=0 --weights=/home/tj/tpj/mltask/cal256_n60/cal256_model_n60/cal256_iter_21000.caffemodel --model=cal256_train.prototxt --class_num=256 --iterations=300 --outfile_name=_iter_21000

#!/usr/bin/env sh

#TOOLS=../../build/tools

#GLOG_logtostderr=1 $TOOLS/train_net.bin lenet_solver.prototxt

#!/bin/bash

#################################
# Let’s define some variables that we need for further pre-processing steps and training the model:
###############################
export MAX_LENGTH=128
export BERT_MODEL='/users5/yuzhouzhang/bert/chinese_L-12_H-768_A-12'


##########################
## Additional environment variables must be set:
#########################
export OUTPUT_DIR='model'
export BATCH_SIZE=32
export NUM_EPOCHS=3
export SAVE_STEPS=750
export SEED=1
export CUDA_VISIBLE_DEVICES=7


######################
# To start training, just run:

python run_ner.py --data_dir ./ \
--model_type bert \
--labels ./labels.txt \
--model_name_or_path $BERT_MODEL \
--output_dir $OUTPUT_DIR \
--max_seq_length  $MAX_LENGTH \
--num_train_epochs $NUM_EPOCHS \
--per_gpu_train_batch_size $BATCH_SIZE \
--save_steps $SAVE_STEPS \
--seed $SEED \
--do_train \
--do_eval \
--do_predict \
--overwrite_output_dir

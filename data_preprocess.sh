#!/bin/bash

#################################
# Let’s define some variables that we need for further pre-processing steps and training the model:
###############################
export MAX_LENGTH=128
export BERT_MODEL='/users5/yuzhouzhang/bert/chinese_L-12_H-768_A-12'

################################
# Run the pre-processing script on training, dev and test datasets:
################################
python preprocess.py train.txt.tmp $BERT_MODEL $MAX_LENGTH > train.txt
python preprocess.py dev.txt.tmp $BERT_MODEL $MAX_LENGTH > dev.txt
python preprocess.py test.txt.tmp $BERT_MODEL $MAX_LENGTH > test.txt


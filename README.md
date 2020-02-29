# BERT_FOR_KE
This is a repository about semi-supervised keyphrase extraction using BERT.

## Introduction
We treat keyphrase extraction as sequence labeling task. Firstly, we use labeled-data to fine-tune BERT. Secondly we feed fine-tuned BERT with lots of unlabeled-data to get predictions. Thirdly we select better predictions to re-trained the BERT to get better performance. We can keep doing this to get improved.

## Data Format
We should prepare `train.txt.tmp`, `dev.txt.tmp` and `test.txt.tmp` in the following format. Given multiple documents in train, dev or test, `word segmentation of documents` should be necessary. Then the keyphrase tag contains only `B`, `I`, `O` in `labels.txt`. And different documents should be seperated by newlines. 

## Fine-tune BERT
1: download Chinese-BERT --see https://github.com/google-research/bert <br>
2: config `BERT_MODEL` in `data_preprocess.sh` and `process.sh` <br>
3: config other params in `process.sh` <br>
4: process data: `./data_preprocess.sh` <br>
5: run: `./process.sh` <br>

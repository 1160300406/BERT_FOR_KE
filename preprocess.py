import sys

from transformers import BertTokenizer

dataset = sys.argv[1]
model_name_or_path = sys.argv[2]
max_len = int(sys.argv[3])

subword_len_counter = 0

tokenizer = BertTokenizer.from_pretrained(model_name_or_path)

sentences = []


def output_sentences(sentences):
    for pair in sentences:
        print(pair)
    print("")
    

with open(dataset, "rt") as f_p:
    docs = f_p.read().strip().split('\n\n')
    for pairs in docs:
        for pair in pairs.split('\n'):
            if len(pair.split(' ')) != 2:
                output_sentences(sentences)
                sentences = []
                subword_len_counter = 0
                continue

            token, tag = pair.split(' ')[0], pair.split(' ')[1]

            current_subwords_len = len(tokenizer.tokenize(token))

            if current_subwords_len == 0:
                continue

            sentences.append(pair)

            if token == '。' or token == '！' or token == '？' or (subword_len_counter + current_subwords_len) > max_len - 2:
                output_sentences(sentences)
                sentences = []
                subword_len_counter = 0

            subword_len_counter += current_subwords_len



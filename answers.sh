#! /usr/bin/env bash 

datasets="$HOME/data-sets"
# Which state in states.tab.gz has the lowest murder rate?
#


states="$datasets/misc/states.tab.gz"

answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2g \
    | head -n1 \
    | cut -f1 \
    | sed 's/"//g') 

echo "answer-1: $answer_1"
#How many sequence records are in the sample.fa file?

sample="$datasets/fasta/sample.fa"
answer_2=$(grep '^>' $sample | wc -l)

echo "answer-2: $answer_2"

# How many unique CpG IDs are in cpg.bed.gz

cpg="$datasets/bed/cpg.bed.gz"

answer_3=$(gzcat $cpg \
    | cut -f4 \
    | sort -k4 \
    | uniq -c \
    | sort -k1n \
    | wc -l)

echo "answer-3: $answer_3"


#How many sequence records are in the SP1.fq file?

SP1="$datasets/fastq/SP1.fq"

answer_4=$(grep '^@cluster' $SP1 | wc -l)

echo "answer-4: $answer_4"

#How many words are on lines containing the word bloody in hamlet.txt?

hamlet="$datasets/misc/hamlet.txt"

answer_5=$(grep 'bloody' $hamlet | wc -w)

echo "answer-5: $answer_5"

#What is the length of the sequence in the first record of sample.fa?

sample="$datasets/fasta/sample.fa"

answer_6=$(awk 'NR==2' $sample |wc -c)

echo "answer-6: $answer_6"

#What is the name of the longest gene in genes.hg19.bed.gz?

genes="$datasets/bed/genes.hg19.bed.gz"

answer_7=$(gzcat $genes \
    | awk 'BEGIN {OFS="\t"}{print $0,$3 - $2}' \
    | sort -k7nr \
    | awk '(NR==1) {print $4}')

echo "answer-7: $answer_7"

#How many unique chromosomes are in genes.hg19.bed.gz?

genes="$datasets/bed/genes.hg19.bed.gz" 

answer_8=$(gzcat $genes\
    | cut -f1 \
    | uniq \
    | wc -l)

echo "answer-8: $answer_8"

#How many intervals are associated with CTCF (not CTCFL) in
#peaks.chr22.bed.gz?

peaks="$datasets/bed/peaks.chr22.bed.gz"

answer_9=$(gzcat $peaks\
    | grep "CTCF" \
    | grep -v "CTCFL" \
    | cut -f4 \
    | wc -l)

echo "answer-9: $answer_9"

#On what chromosome is the largest interval in lamina.bed?

lamina="$datasets/bed/lamina.bed"

answer_10=$(cat $lamina \
    | awk 'BEGIN{OFS="\t"}{print $1, $3-$2}' \
    | sort -k1n \
    | tail -n1 \
    | cut -f1)

echo "answer-10: $answer_10"


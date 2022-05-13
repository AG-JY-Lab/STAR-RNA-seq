#!/bin/bash

sample_directory=$1
name_of_sample=$2
number_of_samples=$3
output_directory=$4
genomeDir="/home/rtlab/Documents/Genomes/genome_indices/star_hg38"

echo "The directory containing these set of samples is ${sample_directory}."
echo "The sample group you are running STAR aligner for is ${name_of_sample}"
echo "There are ${number_of_samples} samples for this sample group."
echo "The output directory for the STAR results is ${output_directory}."

read -p "Are these the right file paths? <Y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
    echo "Running STAR aligner with the specified inputs."
    if [ ! -d $output_directory ]; then
        echo "Creating $output_directory."
        mkdir -p $output_directory
    else
        echo "$output_directory already exist."
        exit 1
    fi
    for i in $(seq 1 ${number_of_samples})
        do

        read1="${sample_directory}/${name_of_sample}_${i}_read_1.fq.gz"
        read2="${sample_directory}/${name_of_sample}_${i}_read_2.fq.gz"
        echo "Running STAR aligner for ${read1} and ${read2}."
        sleep 1

        results="${output_directory}/${name_of_sample}_${i}_outputs_"
        echo "Returning results as ${results}."
        sleep 1

        STAR \
        --runThreadN 16 \
        --genomeDir ${genomeDir} \
        --readFilesIn ${read1} ${read2} \
        --readFilesCommand zcat \
        --quantMode GeneCounts \
        --outFileNamePrefix ${results} \
        --outSAMtype BAM SortedByCoordinate \
        --outSAMunmapped Within \
        --outSAMattributes NH HI NM MD AS

    done

else
    exit 0
fi

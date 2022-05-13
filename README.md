# STAR RNA seq

## Folder hierarchy for STAR RNA-seq read aligner:

```bash
home
└──rtlab
    └── Documents
        ├── Input_fastq
        │   └──Sample_directory_name
        │       ├──sample_1_read_1.fq.gz
        │       ├──sample_1_read_2.fq.gz
        │       ├──sample_2_read_1.fq.gz
        │       ├──sample_2_read_2.fq.gz
        │       ├──sample_3_read_1.fq.gz
        │       └──sample_3_read_2.fq.gz
        │
        └── STAR_outputs
            └──Output_directory_name
                ├──sample_1_outputs
                ├──sample_2_outputs
                └──sample_3_outputs

```
This repository contains the usage instructions of running STAR with the all in one `STAR.sh` bash script.

For more information about STAR, you may refer to their [official Github](https://github.com/alexdobin/STAR).

For this `STAR.sh` bash script, the genome directory is assumed to be `/home/rtlab/Documents/Genomes/genome_indices/star_hg38` but this can be easily changed for a different genome index with Refseq GTF/GFF or others.

### Genome index build example arguments:
```
STAR \
--runThreadN 24 \
--runMode genomeGenerate \
--genomeDir /home/rtlab/Documents/Genomes/genome_indices/star_hg38 \
--genomeFastaFiles /home/rtlab/Documents/Genomes/Refseq_GRCh38/hg38.fa \
--sjdbGTFfile /home/rtlab/Documents/Genomes/Refseq_GRCh38/GCF_000001405.39_GRCh38.p13_genomic.gtf \
--sjdbOverhang 149
```

### Using this bash script:
4 positional arguments are needed and they need to be supplied in the right order.

1. sample_directory: `/home/rtlab/Documents/Input_fastq/Sample_directory_name`
This should be where all the fastq files for this batch of RNA-seq experiments are, for both the treatment or case samples and control samples.

2. name_of_sample: `Sample_Gene_A_KO` or `Sample_Gene_A_WT`

3. name_of_sample: `3` or `4` depending on how many samples you have per condition.

4. output_directory `/home/rtlab/Documents/STAR_outputs/Sample_Gene_A_KO_vs_WT`.
This would be where STAR outputs its results and each result will be prefixed with its sample name and sample index.

Given these example arguments above, an example usage would be:
```
./STAR.sh \
/home/rtlab/Documents/Input_fastq/Sample_directory_name \
Sample_Gene_A_KO \
4 \
/home/rtlab/Documents/STAR_outputs/Sample_Gene_A_KO_vs_WT
```

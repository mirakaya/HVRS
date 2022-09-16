#!/bin/bash
#
zcat MINIDB.fa.gz > VDB.fa
#
gto_fasta_extract_read_by_pattern -p "Synthetic DNA generated with gto" < VDB.fa > SVA.fa
gto_fasta_extract_read_by_pattern -p "AY386330.1" < VDB.fa > B19.fa
gto_fasta_extract_read_by_pattern -p "X04370.1" < VDB.fa > VZV.fa
gto_fasta_extract_read_by_pattern -p "MG921180.1" < VDB.fa > HPV.fa
#
#
# MUTATE SEQUENCES:
#
gto_fasta_mutate -s 0 -e 0.01 < SVA.fa > SVA-1.fa
gto_fasta_mutate -s 0 -e 0.03 < SVA.fa > SVA-2.fa
gto_fasta_mutate -s 0 -e 0.05 < SVA.fa > SVA-3.fa
#
gto_fasta_mutate -s 0 -e 0.01 < B19.fa > B19-1.fa
gto_fasta_mutate -s 0 -e 0.03 < B19.fa > B19-2.fa
gto_fasta_mutate -s 0 -e 0.05 < B19.fa > B19-3.fa
#
gto_fasta_mutate -s 0 -e 0.01 < HPV.fa > HPV-1.fa
gto_fasta_mutate -s 0 -e 0.03 < HPV.fa > HPV-2.fa
gto_fasta_mutate -s 0 -e 0.05 < HPV.fa > HPV-3.fa
#
gto_fasta_mutate -s 0 -e 0.01 < VZV.fa > VZV-1.fa
gto_fasta_mutate -s 0 -e 0.03 < VZV.fa > VZV-2.fa
gto_fasta_mutate -s 0 -e 0.05 < VZV.fa > VZV-3.fa
#
#
# CREATE DATASETS:
#
cat SVA-1.fa B19-1.fa HPV-1.fa VZV-1.fa > DS1.fa
cat SVA-2.fa B19-2.fa HPV-2.fa VZV-2.fa > DS2.fa
cat SVA-3.fa B19-3.fa HPV-3.fa VZV-3.fa > DS3.fa
#
#
# SIMULATE FASTQ READS:
#
art_illumina -rs 0 -ss HS25 -sam -i DS1.fa -p -l 150 -f 10 -m 200 -s 10 -o DS1_
art_illumina -rs 0 -ss HS25 -sam -i DS2.fa -p -l 150 -f 20 -m 200 -s 10 -o DS2_
art_illumina -rs 0 -ss HS25 -sam -i DS3.fa -p -l 150 -f 30 -m 200 -s 10 -o DS3_
#
rm *.aln *.sam
#

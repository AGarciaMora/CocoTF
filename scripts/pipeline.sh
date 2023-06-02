#!/bin/bash
#source pipeline.sh
#BEDTOOLSPATH=

#set variables -m motif_file  a PWM motif file -mp motif_file_path -f region_file a file containing putative enhancer regions -fp input_file_path -g genome assembly -o output_file

genome=hg38
size=200

while getopts 'm:f:g:b:o:s:p:' option; do
        case $option in
                m) motif_file=$OPTARG;;
		f) input_file=$OPTARG;;
                g) genome=$OPTARG;;  # If variable not set or null, set it to default.
                b) genome_file=$OPTARG;; #include file path
                o) output_folder=$OPTARG;;
                s) size=$OPTARG;;  # If variable not set or null, set it to default.
		p) project=$OPTARG;;
                \?) echo "-m motif_file  a PWM motif file -mp motif_file_path -f region_file a file containing putative enhancer regions -fp input_file_path -g genome assembly -o output_file";;
        esac
done

MOTIF_NAME=$(basename "$motif_file")
INPUT_NAME=$(basename "$input_file")

echo "TF is" $MOTIF_NAME
echo "sample is" $INPUT_NAME

######find all instances of first motif in the selected genome
scanMotifGenomeWide.pl $motif_file $genome  -bed > temp/TF_coordinates_${MOTIF_NAME}.bed
#cp temp/TF_coordinates_${MOTIF_NAME}.bed ../pipeline_results_$project/bed_files/${MOTIF_NAME}_$genome.bed

echo "all instances of motif in the genome found"
########find instances of first search motif within tissue-specific putative enhancer regions using bedtools intersect
bedtools intersect -a temp/TF_coordinates_${MOTIF_NAME}.bed -b $input_file > temp/TF_coordinates_ChIPseqregions_${MOTIF_NAME}.bed
cp temp/TF_coordinates_ChIPseqregions_${MOTIF_NAME}.bed ../pipeline_results_$project/bed_files/${MOTIF_NAME}_$INPUT_NAME.bed

echo "all instances of motif in candidate enhancer regions found"

#######create bg, with first search motif instances in randome genomic regions#####
#find number of input regions*2
read lines <<< $(wc -l < $input_file)
number=$((lines*2))
#generate df of random 1000nt bins
bedtools random -n $number -l 1000 -g $genome_file > temp/Random_genome_${INPUT_NAME}.bed
find instances of first search motif in the random bins
bedtools intersect -a temp/TF_coordinates_${MOTIF_NAME}.bed -b temp/Random_genome_${INPUT_NAME}.bed > temp/background_${INPUT_NAME}.bed

echo "instances of motif in random genomic regions for background found"

######use homer to find enriched motifs around first search motif in enhancers vs first search motifs in random genomic regions
findMotifsGenome.pl temp/TF_coordinates_ChIPseqregions_${MOTIF_NAME}.bed $genome ../pipeline_results_$project/${output_folder}_$size -bg temp/background_${INPUT_NAME}.bed -len 5,6,7,8,9,10,11,12 -size $size

echo "enrichment analysis completed"

#remove files
#rm temp/background_${INPUT_NAME}.bed
#rm temp/Random_genome_${INPUT_NAME}.bed
#rm temp/TF_coordinates_${MOTIF_NAME}.bed
#rm temp/TF_coordinates_ChIPseqregions_${MOTIF_NAME}.bed

echo "temporary files removed"

#copy files in separate folders for downstream analysis
#knownResults
cp ../pipeline_results_$project/${output_folder}_$size/knownResults.txt ../pipeline_results_$project/known_results/knownResults_${output_folder}_$size.txt

echo "known motifs copied into known_results folder"

#motif matrices
cd ../pipeline_results_$project/${output_folder}_$size/knownResults/ 
#for f in *.motif; do TF="$(<"$f" grep -oP '(?<=\t).*?(?=/)')" && sed -i "1s/.*/>"$TF"/" "$f" ; done
cat *.motif >> ../../../pipeline_results_$project/motif_files/${MOTIF_NAME}_all_known_motifs.txt
echo "all PWM of known motifs concatenated into all_known_motif.txt file"

cd /home/mbmhtagg/Documents/chapter_2/script


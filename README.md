# CocoTF: a pipeline to predict context-specific co-occurring TF motifs

To investigate the combinatorial TF landscape of context-specific regulatory regions we designed cocoTF, a workflow to identify context-specific co-occurring TF motifs. CocoTF consists of two main steps. The first is the identification of context-specific TF whose motifs are enriched within the corresponding context-specific regulatory regions. We refer to these TFs as First Search TFs. The second step is to carry out motif enrichment analysis in regions flanking First Search TF motifs within regulatory regions of interest to identify co-occurring motifs. We refer to these as Second Search TFs.
![CocoTF diagram](CocoTF.PNG)

## CocoTF implementation

The code included in this repository, corresponds to CocoTF's second step: **identifying Second Search TFs**. Thus to run this code you should have:
1. The PWM corresponding to your TF of interest.
2. A set of input regulatory regions (e.g tissue-specific enhancers).

### Required software
CocoTF is run as a pipeline on the command line.

- Bedtools: CocoTF uses bedtools intersect and bedtools random.
[Bedtools installation page](https://bedtools.readthedocs.io/en/latest/content/installation.html).
- HOMER: CocoTF uses scanMotifGenomeWide.pl and findMotifsGenome.pl.
[HOMER installation page](http://homer.ucsd.edu/homer/introduction/install.html).
- R/Rstudio: CocoTF's output data is then formatted using an R script.
[Rstudio installation page](https://pages.github.com/).

### CocoTF scripts

CocoTF consists of several scripts. However, running run_pipeline.sh (which contains sample cocoTF runs) runs pipeline.sh and mkdir.sh. 

#### pipeline.sh

- $motif_file **-m**: the PWM file/ motif file 
- $input_file **-f**: the input file containing context-specific regions matching the context at which the TF of interest is specifically expressed (e.g ventricle-specific enhancers and ventricle-restricted TF GATA4).
- $genome **-g**: genome build (e.g mm9, mm10, hg38). If this is unset, the default is hg38.
- $genome_file **-b**: genome file, including file path. Currently hg38 and mm19 files are stored within genomes folder
- $output_folder **-o**: name of the output folder
- $size **-s**: the size argument determines how many nucleotides either side of the first search TF motif are used for motif enrichment analysis. If remains unset, the default is 200 (100nt either side).
- $project **-p**: the name of the project, this should be the same as the -p argument in mkdir.sh.

As well as the above parameters, CocoTF will define the folloing from the above:
```
MOTIF_NAME=$(basename "$motif_file")
INPUT_NAME=$(basename "$input_file")
```

First step is to identify all instances of the First Search TF motif in the genome:
```
scanMotifGenomeWide.pl $motif_file $genome  -bed > temp/TF_coordinates_${MOTIF_NAME}.bed
```

Then CocoTF intersects all TF motif coordinates with inout regions of interest to determine **FOREGROUND** regions:
```
bedtools intersect -a temp/TF_coordinates_${MOTIF_NAME}.bed -b $input_file > temp/TF_coordinates_ChIPseqregions_${MOTIF_NAME}.bed
```

Next, CocoTF determines **BACKGROUND** regions by intersecting all First Search TF motif instances with a random set of 1kb genomic regions. The starting number of genomic regions is twice the number of regions in your input set. If your input regions are of another fixed width (e.g 5kb) change 1000nt for your desired width. 

```
#calculate number of starting background regions
read lines <<< $(wc -l < $input_file)
number=$((lines*2))
#generate df of random 1000nt bins
bedtools random -n $number -l 1000 -g $genome_file > temp/Random_genome_${INPUT_NAME}.bed
#find instances of first search motif in the random bins
bedtools intersect -a temp/TF_coordinates_${MOTIF_NAME}.bed -b temp/Random_genome_${INPUT_NAME}.bed > temp/background_${INPUT_NAME}.bed
```




#### mkdir.sh

This script creates all results folders for your project.
- **p** the name of the project, this should be the same as the -p argument in pipeline.sh.

#### run_pipeline.sh
Sample code within run_pipeline is:

```
bash scripts/mkdir.sh -p test_data

bash scripts/pipeline.sh -m motifs/NeuroG1_palate.motif -f input_data/H3K27ac_palate_specific.bed  -o NeuroG1_palate_100 -b genomes/hg38.genome -p test_data

```

#### making_network_dataframe.R
### CocoTF sample input data
### Link to academic paper
### Bibliography



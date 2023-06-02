# CocoTF: a pipeline to predict context-specific co-occurring TF motifs

To investigate the combinatorial TF landscape of context-specific regulatory regions we designed cocoTF, a workflow to identify context-specific co-occurring TF motifs. CocoTF consists of two main steps. The first is the identification of context-specific TF whose motifs are enriched within the corresponding context-specific regulatory regions. We refer to these TFs as First Search TFs. The second step is to carry out motif enrichment analysis in regions flanking First Search TF motifs within regulatory regions of interest to identify co-occurring motifs. We refer to these as Second Search TFs.
![CocoTF diagram](CocoTF.png)

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

- **m** the PWM file/ motif file 
- **f** the input file containing context-specific regions matching the context at which the TF of interest is specifically expressed (e.g ventricle-specific enhancers and ventricle-restricted TF GATA4).
- **g** genome build (e.g mm9, mm10, hg38). If this is unset, the default is hg38.
- **b** genome file, including file path. Currently hg38 and mm19 files are stored within genomes folder
- **o** name of the output folder
- **s** the size argument determines how many nucleotides either side of the first search TF motif are used for motif enrichment analysis. If remains unset, the default is 200 (100nt either side).
- **p** the name of the project, this should be the same as the -p argument in mkdir.sh.

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



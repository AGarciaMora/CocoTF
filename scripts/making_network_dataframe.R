#set working directory to your project folder
#setwd("~/CocoTF/pipeline_results_$project/known_results")
### create a file.list with all knownResults__${output_folder}_$size.txt by running the following commands in the pipeline_results_$project/known_results folder
file.list <- list.files(pattern = "\\.txt$")
#create output folders
dir.create("p5e5") 
dir.create("p5e5/Network")
#apply the pipeline_significant_known_motifs function to all files in file.list. Switch $project for project name.
significant <- sapply(file.list, pipeline_significant_known_motifs,"pipeline_results_$project/known_results", "p5e5",  5,5)

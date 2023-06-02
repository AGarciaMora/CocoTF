pipeline_significant_known_motifs <- function(filename, filepath, outputpath, pvalue, enrichment)
{
  setwd(filepath) #set working directory to known_results
  knownResult <-  read.csv(filename, sep = "\t", header=T) # open file
  knownResult$P.value<- (gsub("1e-|", "", knownResult$P.value)) # find the order of magnitide of the p value, the higher this number the better
  knownResult$X..of.Target.Sequences.with.Motif <- (gsub("%|", "", knownResult$X..of.Target.Sequences.with.Motif)) #remove percentage sign from enrichment
  knownResult$P.value<- as.numeric(as.character(knownResult$P.value)) #p value as character
  knownResult$X..of.Target.Sequences.with.Motif <- as.numeric(as.character(knownResult$X..of.Target.Sequences.with.Motif)) #foreground enrichment as numeric
  knownResult <- knownResult[(knownResult$P.value >= pvalue | (knownResult$P.value == 0 & knownResult$q.value..Benjamini. == 0)) & knownResult$X..of.Target.Sequences.with.Motif > enrichment,]
  if(nrow(knownResult) > 0)
  {
    knownResult$Motif.Name <- (gsub("\\(", "\t", knownResult$Motif.Name)) #substitute parenthesis for a tab
    knownResult$Motif.Name <- (gsub("\\)", "\t", knownResult$Motif.Name)) #substitute parenthesis for a tab
    knownResult$file <- NULL
    knownResult$file <- filename #add file name as a column
    knownResult$file <- (gsub("\\_", "\t", knownResult$file)) #sub underscore in name for  tab
    setwd(outputpath) #change directory to output folder
    write.table(knownResult, filename, sep = "\t", quote = F, row.names = F, col.names = F) #save file
    knownResult <-  read.csv(filename, sep = "\t", header=F) #open file again as tab delimited, this way new columns have been added
    colnames(knownResult) <- c("Target", "Motif.Family", "Experiment", "Database", "programme", "Consensus", "P.value", "Log.P.value", "q.value.Benjamini.", "number_of_Target_Sequences_with_motif" , "percentage_of_Target_Sequences_with_motif", "number_of_bg Sequences_with_motif", "percentage_of_bg_Sequences_with_motif", "file", "Source", "interaction")
    #change colnames
    temp <- knownResult
    temp$directed <- c("FALSE")
    PPI <- as.data.frame(cbind(as.character(temp$Source), as.character(temp$Target), as.character(temp$interaction), temp$directed, temp$P.value))
    colnames(PPI) <- c("Source", "Target", "interaction", "directed", "value")
    PPI <- as.data.frame(PPI)
    PPI$interaction <- (gsub(".txt", "", PPI$interaction)) #sub .txt in tissue name
    knownResult$percentage_of_Target_Sequences_with_motif <- paste0(knownResult$percentage_of_Target_Sequences_with_motif, "%")
    knownResult$P.value <- paste0("1e-", knownResult$P.value)
    write.table(knownResult,filename, sep = "\t", quote = F, row.names = F) #write final table in output folder
    setwd("Network")
    name <- paste0(filename, "_PPI.txt")
    write.table(PPI, name , sep = "\t", quote = F, row.names = F, col.names = T)
  } else
  {
    print(filename)
  }
}


file.list <- list.files(pattern = "\\.txt$")


dir.create("p5e5") #create output folder
dir.create("p5e5/Network") #create output folder
significant <- sapply(file.list, pipeline_significant_known_motifs,"~/Documents/chapter_2/pipeline_results_human_organogenesis/known_results", "p5e5",  5,5)

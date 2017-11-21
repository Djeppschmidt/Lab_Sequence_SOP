#untested! adaptation for prefiltering

library(dada2)

path<-"/path_to_seq_files/Directory"
# Forward and reverse fastq filenames have format: SAMPLENAME_R1_001.fastq and SAMPLENAME_R2_001.fastq
fnFs <- sort(list.files(path, pattern="_R1_001.fastq.gz", full.names = TRUE)) #
fnRs <- sort(list.files(path, pattern="_R2_001.fastq.gz", full.names = TRUE))
pathF<-file.path(path, "filteredF")
pathR<-file.path(path, "filteredR")

if(length(fnFs) != length(fnRs)) stop("Forward and reverse files do not match.")
#fwd=file path for forward
 
# Filtering: THESE PARAMETERS ARENT OPTIMAL FOR ALL DATASETS
filterAndTrim(fwd=file.path(path, fnFs), filt=file.path(pathF, fnFs)
              rev=file.path(path, fnRs), filt.rev=file.path(pathR, fnRs)
              trimLeft=20, maxEE=2, truncQ=11, maxN=0, rm.phix=TRUE,
              compress=TRUE, verbose=TRUE, multithread=TRUE)


# unedited copy and paste of tutorial: https://benjjneb.github.io/dada2/bigdata_paired.html

#library(dada2); packageVersion("dada2")
# File parsing
#pathF <- "/path/to/FWD" # CHANGE ME to the directory containing your demultiplexed forward-read fastq files
#pathR <- "/path/to/REV" # CHANGE ME ...
#filtpathF <- file.path(pathF, "filtered") # Filtered forward files go into the pathF/filtered/ subdirectory
#filtpathR <- file.path(pathR, "filtered") # ...
#fastqFs <- sort(list.files(pathF, pattern="fastq.gz"))
#fastqRs <- sort(list.files(pathR, pattern="fastq.gz"))
#if(length(fastqFs) != length(fastqRs)) stop("Forward and reverse files do not match.")
# Filtering: THESE PARAMETERS ARENT OPTIMAL FOR ALL DATASETS
#filterAndTrim(fwd=file.path(pathF, fastqFs), filt=file.path(filtpathF, fastqFs),
 #             rev=file.path(pathR, fastqRs), filt.rev=file.path(filtpathR, fastqRs),
  #            truncLen=c(240,200), maxEE=2, truncQ=11, maxN=0, rm.phix=TRUE,
   #           compress=TRUE, verbose=TRUE, multithread=TRUE)

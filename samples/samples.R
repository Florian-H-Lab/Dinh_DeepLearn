
# To find samples which we will use
SRR <- read.delim("/home/flow/Documents/Dinh/SRR.csv", header=T) 
kmer <- read.delim("/home/flow/Documents/Dinh/feature_sheet.csv", header=T)

kmer_enriched_protiens <- kmer[which(kmer$kmer_enrich == "Y"),]$protein

protinsheet <- match(SRR$RBP, kmer_enriched_protiens)
missing_protiens <- kmer_enriched_protiens[-unique(protinsheet)[-1]]

write.csv(SRR[which(is.nan(protinsheet)==FALSE),], "/home/flow/Documents/Dinh/download_proteins.csv")

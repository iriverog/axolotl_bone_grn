################################################################################
#                                                                              #
#                        EXTRACT GRN TO RUN CELLORACLE                         #
#                                                                              #
################################################################################

# Load TENET network (merged) and prioiritization of candidates
setwd("~/NetVolumes/LAB_MT/RESULTADOS/Ines/Axolotl_Limb_Regeneration/")
net <- read.csv("Results/TENET_GRNI/BLct_CSDct_TENET_EdgeTable_ForCytoscape.tsv",
                header = TRUE, sep = "\t")

# Reformat grn for celloracle
celloracle_net <- data.frame(TF = unique(net$Source_AMEXID),
                             Target_genes = NA)

for(i in 1:nrow(celloracle_net)){
  tf <- celloracle_net[i, "TF"]
  targets <- net[net$Source_AMEXID == tf, "Target_AMEXID"]
  celloracle_net[i, "Target_genes"] <- paste0(targets, collapse = ", ")
}

write.csv(celloracle_net, "Results/celloracle/20230704_BLct_CSDct_edgeDF_TENET_celloracle.tsv",
          col.names = TRUE, row.names = FALSE, quote = FALSE, sep = "\t")
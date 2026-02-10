# Name: Pawar; Date: 01/27/2026; Purpose: Microarray Analysis

# Install Affymetrix library/Package

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("affy")

# Loads the library Affy
library(affy)

# Set the working directory to a folder where you have .CEL files
setwd("/Users/pawar/Desktop")

# Read the 4 .CEL files in R
data <- ReadAffy()

# Generate a boxplot to visualize dataset
boxplot(data)

# Normalize the dataset to remove any outliers and stable the median for all .CEL files
normalizeddata <- rma(data)

# Generate a boxplot to visualize normalized dataset
boxplot (exprs(normalizeddata))

# Fold change analysis for comparing treatment vs control samples
# Lets assume GSM4843.CEL and GSM4844.CEL samples to be Leukemia/Blood cancer and GSM4845.CEL and GSM4846.CEL to be Normal blood samples

# Take means/average on each row 
Newdata <- exprs(normalizeddata)
Treatment <- Newdata[,c(1,2)]
Control <- Newdata[,c(3,4)]

# Apply the rowmeans function to calculate averages
Treatmentaverage <- rowMeans(Treatment)
Controlaverage <- rowMeans(Control)

# Apply fold change by subtraction
foldchange <- Treatmentaverage - Controlaverage

# If genes fold change value if >2 its an up-regulated gene, and if its <-2 its and down-regulated gene, and if genes are between -2 and +2 they are insignificant genes

# Export variable foldchange in an CSV file

write.csv(foldchange, "foldchange.csv")






















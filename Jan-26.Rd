# Author: Pawar, Date: Jan 26, Purpose: Microarray analysis

# Setting the working directory

setwd("/Users/pawar/Desktop/data")

# Loading package affy

library(affy)

# Read the CEL files

eset <- ReadAffy()

# Plot the raw data

rma <- exprs(eset)

boxplot(rma)




# Loading libraries et datasets
library(haven)
library(metafor)
library(tidyverse)
NEP <- read_sav("NEP.sav")
ObjKnow      <- read_sav("Objective Knowledge.sav")
SubjKnow <- read_sav("Subjective Knowledge.sav")
FreeMark <- read_sav("Support for Free-market Ideology.sav")
TrustScientist <- read_sav("Trust in Scientists.sav")

##################################
#### 1. Objective Knowledge ######
##################################
# Data cleaning
ObjKnow[15,1] <- "Hine, D. W., Reser et al (2013)" 

# => The authors report Fisher-Z scores, transformations of correlation coefficients so they are 
# normally distributed

# Let's start with objective knowledge. We need a measure of the variance of the effect size.
meta.analysis <- metacor(cor = ObjKnow$corr,n=ObjKnow$Sample_size,studlab = ObjKnow$Study_name,comb.random = T,comb.fixed = F)
# Exclude the one which does not link climate change and anthropogenic activities 
meta.analysis.anthropo <- metacor(cor = corr,n=Sample_size,studlab = Study_name,comb.random = T,data=ObjKnow[-7,])
summary(meta.analysis)
forest(meta.analysis)
meta.analysis$n <- floor(meta.analysis$n)
# Forest plot in ggplot
forest(meta.analysis)
forest(meta.analysis)
forest <- data.frame(
  meta.analysis$,meta.analysis$lower,meta.analysis$upper)
atan
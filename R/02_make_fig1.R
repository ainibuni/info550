#! /usr/local/bin/Rscript

# read data
dat <- read.csv("clean_data/data.csv", header = TRUE)

# plot of survival curves by treatment group
library(survival)
library(survminer)
png("figs/fig1.png")
fit_drug2 <- survfit(Surv(time, status) ~ drug, data = dat)
ggsurvplot(fit_drug2, data=dat, pval=TRUE)
dev.off()

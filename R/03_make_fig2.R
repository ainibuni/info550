#! /usr/local/bin/Rscript

# read data
dat <- read.csv("clean_data/data.csv", header = TRUE)

# plot of survival curves by serum bilirubin group
library(survival)
library(survminer)
png("figs/fig2.png")
fit_bilirubin2 <- survfit(Surv(time, status) ~ bilirubin_cat, data = dat)
ggsurvplot(fit_bilirubin2, data=dat, pval=TRUE)
dev.off()

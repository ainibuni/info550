#! /usr/local/bin/Rscript

# read data
dat = read.csv("raw_data/project1_data-1.csv", header = FALSE, sep = "")

# rename columns
colnames(dat) = c("id", "time", "status", "drug", "age", "sex", "ascites","hepatomegaly", "spiders","edema","serum_bilirubin","serum_cholesterol", "albumin", "urine_copper", "alkaline_phosphatase","SGOT","triglicerides","platelets","prothrombin","histologic_stage")

# change variables
dat$status = ifelse(dat$status==2,1,0)
dat$bilirubin_cat = ifelse(dat$serum_bilirubin<1.1,1,ifelse(1.1<=dat$serum_bilirubin & dat$serum_bilirubin<=3.3,2,3))
dat$bilirubin_cat = factor(dat$bilirubin_cat, levels=c(1,2,3),labels=c("<1.1","1.1-3.3",">3.3"))
dat$age_year = dat$age/365.25
dat$drug = factor(dat$drug, levels = c(1,2), labels = c("treatment","placebo"))
dat$drug = relevel(dat$drug, ref = 2)

# save data
write.csv(dat, "clean_data/data.csv", quote = FALSE, row.names = FALSE)

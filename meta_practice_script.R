devtools::install_github("dstanley4/metaPsychometric")
devtools::install_github("dstanley4/apaTables")
library(tidyverse)
ex1_data <- read_csv("meta_data_ex1.csv")

#See variable labels
glimpse(ex1_data)

#See first few lines of data
ex1_data

library(metaPsychometric)
?metaPsychometric
ex1_results <- meta_bare_bones(ex1_data)
ex1_results

# Credibility Interval (Usually 80%) - Estimated range of population correlations (how it can change with moderators)
# R_bar = r (correlation)
# Variance of 1000 studies = var_obs (standard weighted variance)
# Variability expected due to random sampling = var_exp
# per_error =  var_exp/var_obs > 75% means no moderators (<75% means there's moderators)
## LL and UL = meta-analytic confidence interval
## cred_LL and cred_UL = 80% credibility interval - suggests no moderators 

meta_plot_funnel(ex1_results)
meta_plot_funnel (ex1_results, show_null_dist = T)

ex2_data <- read_csv("meta_data_ex2.csv")
ex2_results <- meta_bare_bones(ex2_data)
ex2_results
meta_plot_funnel (ex2_results, show_null_dist = T)
meta_plot_forest(ex2_results)

ex3_data <- read_csv("meta_data_ex3.csv")
ex3_results <- meta_bare_bones(ex3_data)
meta_plot_funnel (ex3_results, show_null_dist = T)
meta_plot_forest(ex3_results)

ex3_canada <- ex3_data %>% filter(country=="Canada")
ex3_usa <- ex3_data %>% filter(country=="United States")

ex3_results_canada <- meta_bare_bones(ex3_canada)
ex3_results_usa <- meta_bare_bones(ex3_usa)

meta_plot_funnel (ex3_results_canada, show_null_dist = T)
meta_plot_funnel (ex3_results_usa, show_null_dist = T)

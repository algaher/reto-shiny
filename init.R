my_packages <- c("readr","sunburstR","tidyverse","shinydashboard")
install_if_missing <- function(p) {
  if(p %in% rownames(installed.packages())==FALSE){
    install.packages(p)}
}
invisible(sapply(my_packages, install_if_missing))
#install.packages("devtools")
#devtools::install_github("timelyportfolio/sunburstR")

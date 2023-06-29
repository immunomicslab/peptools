## code to prepare `BLOSUM50` dataset goes here
BLOSUM50 <- read.table(
  file = "https://ftp.ncbi.nih.gov/blast/matrices/BLOSUM50",
  skip = 6)
BLOSUM50 <- as.matrix(BLOSUM50[1:20, 1:20])
usethis::use_data(BLOSUM50, overwrite = TRUE)

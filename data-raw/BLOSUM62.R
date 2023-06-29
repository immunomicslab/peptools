## code to prepare `BLOSUM62` dataset goes here
BLOSUM62 <- read.table(
  file = "https://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62",
  skip = 6)
BLOSUM62 <- as.matrix(BLOSUM62[1:20, 1:20])
usethis::use_data(BLOSUM62, overwrite = TRUE)

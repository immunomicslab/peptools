## code to prepare `BLOSUM62_enc` dataset goes here
BLOSUM62_enc <- cbind(
  peptools::BLOSUM62,
  matrix(data = 0, nrow = 20, ncol = 1, dimnames = list(NULL, "X")))
BLOSUM62_enc <- rbind(
  BLOSUM62_enc,
  matrix(data = 0, nrow = 1, ncol = 21, dimnames = list("X", NULL)))
BLOSUM62_enc <- BLOSUM62_enc / 5
usethis::use_data(BLOSUM62_enc, overwrite = TRUE)

## code to prepare `BLOSUM50_enc` dataset goes here
BLOSUM50_enc <- cbind(
  peptools::BLOSUM50,
  matrix(data = 0, nrow = 20, ncol = 1, dimnames = list(NULL, "X")))
BLOSUM50_enc <- rbind(
  BLOSUM50_enc,
  matrix(data = 0, nrow = 1, ncol = 21, dimnames = list("X", NULL)))
BLOSUM50_enc <- BLOSUM50_enc / 5
usethis::use_data(BLOSUM50_enc, overwrite = TRUE)

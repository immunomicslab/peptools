## code to prepare `BLOSUM62_pca` dataset goes here

BLOSUM62_pca <- peptools::BLOSUM62 |>
  prcomp(center = TRUE, scale. = FALSE) |>
  _[["x"]] |>
  rbind(matrix(data = 0, nrow = 1, ncol = 20, dimnames = list("X", NULL)))
s <- mean(abs(c(max(BLOSUM62_pca), min(BLOSUM62_pca))))
BLOSUM62_pca <- round(BLOSUM62_pca / s, 3)

usethis::use_data(BLOSUM62_pca, overwrite = TRUE)

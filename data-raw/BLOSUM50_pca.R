## code to prepare `BLOSUM50_pca` dataset goes here

BLOSUM50_pca <- peptools::BLOSUM50 |>
  prcomp(center = TRUE, scale. = FALSE) |>
  _[["x"]] |>
  rbind(matrix(data = 0, nrow = 1, ncol = 20, dimnames = list("X", NULL)))
s <- mean(abs(c(max(BLOSUM50_pca), min(BLOSUM50_pca))))
BLOSUM50_pca <- round(BLOSUM50_pca / s, 3)

usethis::use_data(BLOSUM50_pca, overwrite = TRUE)

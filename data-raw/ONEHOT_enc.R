## code to prepare `one_hot_enc` dataset goes here

ONEHOT_enc <- diag(x = 1, nrow = 21, ncol = 21)
rownames(ONEHOT_enc) <- rownames(peptools::BLOSUM50_enc)
colnames(ONEHOT_enc) <- colnames(peptools::BLOSUM50_enc)

usethis::use_data(ONEHOT_enc, overwrite = TRUE)

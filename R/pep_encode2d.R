#' Encode a peptide
#'
#' Peptides are encoded using either the BLOSUM50, BLOSUM62 or a user specified
#' custom encoding matrix
#'
#' Each position in the peptide become a vector of 21 values, corresponding to
#' the logarithm for the ratio of the likelihood of two amino acids appearing
#' with a biological sense and the likelihood of the same amino acids appearing
#' by chance. These values are then divided by 5 to accommodate scaled input,
#' to neural networks. \code{'X'} is encoded as the zero-vector.
#'
#' The final result is a 3D array (tensor) of peptide 'images' with \code{n}
#' rows, \code{k} columns and \code{21} slices, which is stored as a 3D array
#' (tensor).
#'
#' @param x A character vector of peptides to be encoded
#' @param mat An encoding matrix, one of c("BLOSUM50", "BLOSUM62",
#'            "BLOSUM50_pca", "BLOSUM62_pca", "ONEHOT_enc")
#' @param n_pcs The number of principle components used for encoding. Only
#'              relevant if mat is one of c("BLOSUM50_pca", "BLOSUM62_pca")
#' @param flatten A logical, if FALSE (default) the full tensor will be
#'                returned, if TRUE tensor will be flattened, such that each row
#'                is a peptide and each column an encoding value. In essence,
#'                each peptide image is flattened to a vector by concatenating
#'                the rows in the encoded matrix constituting the image.
#'
#' @return A 3D array (tensor) of peptide 'images' with dimensions
#' number_of_peptides x length_peptides x length_encoding (20 aminoacids + X = 21)
#'
#' @examples
#'
#' peps = pep_ran(k = 9, n = 10)
#'
#' X1 = pep_encode2d(peps, mat = "BLOSUM50")
#' dim(X1)
#'
#' X2 = pep_encode2d(peps, mat = "BLOSUM62")
#' dim(X2)
#'
#' X3 = pep_encode2d(peps, mat = "BLOSUM50_pca", n_pcs = 10)
#' dim(X3)
#'
#' X4 = pep_encode2d(peps, mat = "BLOSUM62_pca", n_pcs = 10)
#' dim(X4)
#'
#' X5 = pep_encode2d(peps, mat = "BLOSUM50_pca", n_pcs = 5)
#' dim(X5)
#'
#' X6 = pep_encode2d(peps, mat = "BLOSUM62_pca", n_pcs = 5)
#' dim(X6)
#'
#' custom_mat = round(matrix(data = rnorm(n = 441), nrow = 21, ncol = 21,
#'                           dimnames = list(c(AMINOACIDS$one, 'X'), c(AMINOACIDS$one, 'X'))), 2)
#' X7 = pep_encode2d(peps, mat = custom_mat)
#' dim(X7)
#'
#' @export
pep_encode2d <- function(x, mat, n_pcs = 10, flatten = FALSE){

  # Allowed matrices
  m_allowed <- c("BLOSUM50", "BLOSUM62",
                 "BLOSUM50_pca", "BLOSUM62_pca",
                 "ONEHOT")

  # Check arguments
  if( is.character(mat) && !(mat %in% m_allowed)){
    stop(paste0("Please specify one of ", m_allowed,
                " or a custom encoding matrix"))
  }
  # Check custom matrix
  if( !is.numeric(mat) && !(mat %in% m_allowed) ){
    stop("Custom encoding matrix has to be numeric")
  }

  # Check input vector
  pep_check(x = x, require_length = TRUE)

  # Set encoding matrix
  # ??? Perhaps encode 'X' as noise, e.g. runif(n = 10, min = -1, max = 1)
  # ??? This way, the network will not be able to identify (0, 0, 0, ...)
  # ??? as a predictor for binding yes/no
  mat_enc <- NULL
  if( !is.numeric(mat) && mat == "BLOSUM50" ){
    mat_enc <- peptools::BLOSUM50_enc
  }
  if( !is.numeric(mat) && mat == "BLOSUM62" ){
    mat_enc <- peptools::BLOSUM62_enc
  }
  if( !is.numeric(mat) && mat == "ONEHOT" ){
    mat_enc <- peptools::ONEHOT_enc
  }
  if( !is.numeric(mat) && mat == "BLOSUM50_pca" ){
    mat_enc <- peptools::BLOSUM50_pca[,1:n_pcs]
  }
  if( !is.numeric(mat) && mat == "BLOSUM62_pca" ){
    mat_enc <- peptools::BLOSUM62_pca[,1:n_pcs]
  }
  if( is.numeric(mat) ){
    mat_enc <- mat
  }
  if( is.null(mat_enc) ){
    stop("The encoding matrix could not be found, check if object exists")
  }

  # Then we convert the vector of peptides to a matrix
  # with dimensions 'm x n' = 'n_peps x length_peps'
  pep_mat <- pep_split(x = x)

  # Assign meaningful variable names to dimensions
  n_peps <- length(x)       # i'th row
  l_peps <- nchar(x[1])     # j'th column
  l_enc <- ncol(mat_enc)    # k'th slice

  # Finally we define our output tensor as a 3d array
  # with dimensions n_peps x l_peps x l_enc (l_enc = 21)
  # ASCII cube illustration:
  #     Pep pos 123.n
  #             -----
  #     pep_1  |\     encoding value 1
  #     pep_2  | \    encoding value 2
  #     pep_3  |  \   encoding value 3
  #     pep_.  |   \  encoding value ...
  #     pep_m  |    \ encoding value l
  #
  o_tensor <- array(data = NA, dim = c(n_peps, l_peps, l_enc))
  #o_tensor <- array(data = NA, dim = c(l_peps, l_enc, n_peps))
  for( i in 1:n_peps ){
    pep_i_residues <- pep_mat[i,]
    pep_img <- mat_enc[pep_i_residues,]
    #o_tensor[,,i] <- pep_img
    o_tensor[i,,] <- pep_img
  }
  # dimnames(o_tensor) <- list(paste0("p", 1:l_peps),
  #                            colnames(mat_enc),
  #                            x)
  dimnames(o_tensor) <- list(x,
                             paste0("p", 1:l_peps),
                             colnames(mat_enc))

  # Flatten?
  # y = pep_encode2d("LSDGMSLL", BLOSUM62)
  # t(apply(y, 1, function(x_k){ return( matrix(t(x_k), nrow = 1) ) }))
  if( flatten ){
    return(
      t(apply(o_tensor, 1, function(x_k){ return( matrix(t(x_k), nrow = 1) ) }))
    )
  }

  # Done, return
  return(o_tensor)
}

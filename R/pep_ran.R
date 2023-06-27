#' Generate Random Peptides
#'
#' This function generates random peptides by sampling amino acid residues.
#'
#' @param n Number of peptides to generate.
#' @param k Length of each peptide.
#'
#' @return A character vector containing the generated random peptides.
#' @export
#'
#' @examples
#' pep_ran(n = 10, k = 5)
#'
pep_ran = function(n, k){

  # Define the standard 20 amino acid residue characters
  res_chars <- c("A", "R", "N", "D", "C", "Q", "E", "G", "H", "I",
                 "L", "K", "M", "F", "P", "S", "T", "W", "Y", "V")

  # First we generate one long vector with all the sampled residues
  smpl_chars <- sample(res_chars, size = n*k, replace = TRUE)

  # Then we collapse into one long string
  smpl_string <- paste0(smpl_chars, collapse = '')

  # Now we generate indices corresponding to extracting every 9 residues
  to_index <- seq(from = k, to = k*n, by = k)
  from_index <- to_index - (k-1)

  # and extract using sub string
  ran_peptides <- substring(text = smpl_string,
                            first = from_index,
                            last = to_index)

  # Done, return
  return( ran_peptides )

}

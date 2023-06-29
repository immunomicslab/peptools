#' Convert a vector of peptides to matrix form
#'
#' @param x A vector of equal length peptides
#'
#' @return A n_pep x l_pep matrix
#'
#' @examples
#' pep_split(x = c("RQGQDHPTM","RGQKTTDNA","NILYEYWDY"))
#'
#' @export
pep_split <- function(x){

  # Check input
  pep_check(x = x, require_length = TRUE)

  # Convert to matrix
  # do.call applies a function to the list returned from args
  # so rbind to form matrix each of the elements in the list returned
  # by strsplit
  return( do.call(what = rbind, args = strsplit(x = x, split = '')) )
}

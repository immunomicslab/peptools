#' Check if a vector of peptides is valid.
#'
#' According to criteria:
#'
#'  i.   Is a vector with one or more elements
#'
#'  ii.  Is a character vector
#'
#'  iii. All elements in vector have the same number of characters (depending on the require_length argument)
#'
#'  iv.  Elements only contain allowed amino acid residues \code{'ARNDCQEGHILKMFPSTWYVX-'}
#'
#' @param x A vector of peptides to be checked
#' @param require_length Restrict to also requiring that all peptides have same length
#'
#' @return TRUE if the vector passed the check, otherwise stop() is called
#'
#' @examples
#' pep_check(x = c("RQGQDHPTM","RGQKTTDNA","NILYEYWDY"))
#' pep_check(x = c("RQGQDHPTM","RGQKTTDNA","NILYEYWDYX"), require_length = FALSE)
#'
#' @export
pep_check <- function(x, require_length = TRUE){

  # Check if 'pep' is a character vector
  if( !( is.vector(x) & is.character(x) ) ){
    stop("'pep' has to be a character vector with one or more peptides!")
  }

  # Check if all sequences are of equal length
  if( require_length & !all( nchar(x) == nchar(x[1])) ){
    stop("All peptides must have equal number of positions")
  }

  # Check if 'pep' contain non-allowed amino acid residue characters
  if( grepl(pattern = "[^ARNDCQEGHILKMFPSTWYVX-]",
            x = paste0(x, collapse='')) ){
    stop("Non standard amino acid residue character found. Only 'ARNDCQEGHILKMFPSTWYVX-' allowed")
  }

  # Done, return
  return(TRUE)
}

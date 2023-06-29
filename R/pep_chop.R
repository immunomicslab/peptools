#' Chop a vector of peptides into k-mers
#'
#' This function chops peptide sequences into smaller subsequences of length \code{k}.
#'
#' @param x A vector of peptides
#' @param k length of k-mers
#'
#' @return A list of the possible k-mers generated for each peptide. Each element in the list corresponds to a sequence in \code{x}.
#'
#' @examples
#' peps = pep_ran(k = 9, n = 10)
#' kmers = pep_chop(x = peps, k = 3)
#'
#' @export
pep_chop = function(x, k){

  # Initialize an empty list to store the chopped sequences
  out = lapply(X = 1:length(x), FUN = function(i){
    # For each sequence at index i

    # Calculate the length of the sequence
    l = nchar(x = x[i])

    if( l < k ){
      # If the sequence length is less than k
      current = NA  # Assign NA to the current chopped sequence
    } else {
      # If the sequence length is greater than or equal to k
      n = l - k + 1  # Calculate the number of chopped sequences that can be generated

      # Generate the chopped sequences using the sapply function
      current = sapply(X = 1:n, FUN = function(j){
        return( substr(x = x[i], start = j, stop = j + k - 1) )
        # Extract the substring from position j to j + k - 1
      })
    }

    # Return the current chopped sequences for the i-th sequence
    return( current )
  })

  # Return the named list of chopped sequences
  names(out) <- x
  return(out)
}

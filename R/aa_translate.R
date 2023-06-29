#' Translate between amino acid residue symbols
#'
#' \code{aa_translate()} tranlates back and forth between 'one', 'three', 'full'
#' and 'chemistry' representations of the 20 proteogenic amino acids
#'
#' @param x A character vector of valid amino acid residue symbols either in
#' one-, three- or full format. Valid amino acid residue symbols are
#' \code{ARNDCQEGHILKMFPSTWYV}
#'
#' @param to Which symbol to translate to, one of
#' \code{'one', 'three', 'full', 'chemistry'}
#'
#' @return A character vector with the translated symbols
#'
#' @examples
#' aa_translate(AMINOACIDS$full, to = 'one')
#' aa_translate(AMINOACIDS$full, to = 'three')
#' aa_translate(AMINOACIDS$full, to = 'chemistry')
#'
#' @export
aa_translate <- function(x, to){

  # Check 'to' argument
  to <- tolower(to)
  if( !(to %in% c('one', 'three', 'full', 'chemistry')) ){
    stop("Translation 'to' arguments must be one of 'one', 'three', 'full' or 'chemistry'")
  }

  # Make sure that input is formatted, such that the first letter is upper and the
  # rest are lower
  x <- tolower(x)
  first_char <- substr(x = x, start = 1, stop = 1)
  first_char <- toupper(first_char)
  substr(x = x, start = 1, stop = 1) <- first_char

  # Detect input type
  input_type <- NULL
  if( all(x[!is.na(x)] %in% peptools::AMINOACIDS$one) ){
    input_type <- 'one'
  } else {
    if( all(x[!is.na(x)] %in% peptools::AMINOACIDS$three) ){
      input_type <- 'three'
    } else {
      if( all(x[!is.na(x)] %in% peptools::AMINOACIDS$full) ){
        input_type <- 'full'
      }
    }
  }

  # Stop if invalid input type
  if( is.null(input_type) ){
    stop("Input must be one of valid one-, three- or full amino acid name. E.g. 'A', 'Ala' or 'Alanine'")
  }

  # Do translation
  translation_table <- peptools::AMINOACIDS
  rownames(translation_table) <- peptools::AMINOACIDS[,input_type]

  # Done, return
  return( translation_table[x,to] )

}

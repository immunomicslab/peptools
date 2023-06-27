#' Amino Acid Residue Background Frequencies
#'
#' Naturally observed amino acid residue background frequencies are available
#' from the Proteome-pI DB. Proteome Isoelectric Point Database is a database of
#' pre-computed isoelectric points for proteomes from different model organisms.
#'
#' Reference paper:
#'     Proteome-pI: proteome isoelectric point database
#'     Lukasz P. Kozlowski
#'     Nucleic Acids Research, Volume 45, Issue D1, 4 January 2017, Pages D1112–
#'     D1116, https://doi.org/10.1093/nar/gkw978
#'
#' @format A data frame with 5 rows and 20 columns:
#' \describe{
#'   \item{name}{One-letter symbol for each of the 20 standard proteogenic amino acids}
#'   \item{Kingdom}{Viruses, Archaea, Bacteria, Eukaryota and All}
#' }
#' @source \url{http://isoelectricpointdb.org/statistics.html}
"BGFREQS"

#' Symbol translation table for the 20 standard proteogenic amino acids
#'
#' Symbol translation table for the 20 standard proteogenic amino acids
#'
#' @format A data frame with 20 rows and 4 columns:
#' \describe{
#'   \item{full}{Full-name symbol}
#'   \item{three}{Three-letter symbol}
#'   \item{one}{One-letter symbol}
#'   \item{chemistry}{The chemical grouping of the residue}
#' }
"AMINOACIDS"

#' 5,000 9-mer peptides
#'
#' 5,000 9-mer peptides predicted to be strong binders to HLA-A*02:01 by netMHCpan-4.0
#'
#' @format A character vector with 5,000 strings of length 9
"PEPTIDES"

#' The BLOSUM62 matrix
#'
#' The BLock SUbstition matrix for sequences with less than 62\% similarity.
#' The matrix has been subset to the 20 proteogenic amino acids
#'
#' Matrix made by matblas from blosum62.iij
#'
#' * column uses minimum score
#'
#' BLOSUM Clustered Scoring Matrix in 1/2 Bit Units
#'
#' Blocks Database = /data/blocks_5.0/blocks.dat
#'
#' Cluster Percentage: >= 62
#'
#' Entropy =   0.6979, Expected =  -0.5209
#'
#' @format A data frame with with 20 rows and 20 columns
#' @source \url{ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62}
"BLOSUM62"

#' The BLOSUM50 matrix
#'
#' The BLock SUbstition matrix for sequences with less than 50\% similarity.
#' The matrix has been subset to the 20 proteogenic amino acids
#'
#' Matrix made by matblas from blosum50.iij
#'
#' * column uses minimum score
#'
#' BLOSUM Clustered Scoring Matrix in 1/3 Bit Units
#'
#' Blocks Database = /data/blocks_5.0/blocks.dat
#'
#' Cluster Percentage: >= 50
#'
#' Entropy =   0.4808, Expected =  -0.3573
#'
#' @format A data frame with with 20 rows and 20 columns
#' @source \url{ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM50}
"BLOSUM50"


#' The BLOSUM62 matrix
#'
#' The BLOSUM62 matrix transformed for encoding by dividing by 5. Furthermore,
#' row and column zero vectors representing 'X' has been added.
#'
#' The BLock SUbstition matrix for sequences with less than 62\% similarity.
#' The matrix has been subset to the 20 proteogenic amino acids
#'
#' Matrix made by matblas from blosum62.iij
#'
#' * column uses minimum score
#'
#' BLOSUM Clustered Scoring Matrix in 1/2 Bit Units
#'
#' Blocks Database = /data/blocks_5.0/blocks.dat
#'
#' Cluster Percentage: >= 62
#'
#' Entropy =   0.6979, Expected =  -0.5209
#'
#' @format A data frame with with 20 rows and 20 columns
#' @source \url{ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62}
"BLOSUM62_enc"

#' The BLOSUM50 matrix
#'
#' The BLOSUM50 matrix transformed for encoding by dividing by 5. Furthermore,
#' row and column zero vectors representing 'X' has been added.
#'
#' The BLock SUbstition matrix for sequences with less than 50\% similarity.
#' The matrix has been subset to the 20 proteogenic amino acids
#'
#' Matrix made by matblas from blosum50.iij
#'
#' * column uses minimum score
#'
#' BLOSUM Clustered Scoring Matrix in 1/3 Bit Units
#'
#' Blocks Database = /data/blocks_5.0/blocks.dat
#'
#' Cluster Percentage: >= 50
#'
#' Entropy =   0.4808, Expected =  -0.3573
#'
#' @format A data frame with with 20 rows and 20 columns
#' @source \url{ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM50}
"BLOSUM50_enc"

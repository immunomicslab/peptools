#' Amino Acid Residue Background Frequencies
#'
#' Naturally observed amino acid residue background frequencies are available
#' from the Proteome-pI DB. Proteome Isoelectric Point Database is a database of
#' pre-computed isoelectric points for proteomes from different model organisms.
#'
#' Reference paper:
#'     Kozlowski LP. Proteome-pI 2.0: proteome isoelectric point database
#'     update. Nucleic Acids Res. 2022 Jan 7;50(D1):D1535-D1540. doi:
#'     10.1093/nar/gkab944. PMID: 34718696; PMCID: PMC8728302.
#'
#' @format A data frame with 5 rows and 21 columns, where rows pertain to Kingdom
#'     and columns to amino acids
#' @source \url{https://isoelectricpointdb2.mimuw.edu.pl/statistics.html#aa_stats}
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


#' An allele data set of random 9-mer peptides
#'
#' Each peptide has been in silico analysed for binding to six alleles:
#' \code{HLA-A01:01}, \code{HLA-A02:01}, \code{HLA-A03:01},
#' \code{HLA-B07:02}, \code{HLA-B08:01}, \code{HLA-B27:05}. Analysis was
#' performed using netMHCpan4.1b.
#'
#' @format A data frame with 132,091 rows and 6 columns
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
#' @source \url{https://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62}
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
#' @source \url{https://ftp.ncbi.nih.gov/blast/matrices/BLOSUM50}
"BLOSUM50"


#' The BLOSUM62 encoding matrix
#'
#' The BLOSUM62 matrix transformed for encoding by dividing by 5. Furthermore,
#' row and column zero vectors representing 'X' has been added.
#'
#' @format A data frame with with 21 rows and 21 columns
#' @source \url{ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62}
"BLOSUM62_enc"


#' The BLOSUM50 encoding matrix
#'
#' The BLOSUM50 matrix transformed for encoding by dividing by 5. Furthermore,
#' row and column zero vectors representing 'X' has been added.
#'
#' @format A data frame with with 21 rows and 21 columns
#' @source \url{ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM50}
"BLOSUM50_enc"


#' The BLOSUM62 encoding pca matrix
#'
#' The BLOSUM62 matrix transformed for encoding by performing a PCA
#' and then using n number of PCs for encoding. Below table show the
#' cumulative explained variation, such that, e.g. incl. 10 PCs, will
#' correspond to 96.1% EV.
#'
#' @details
#'  | PC | Cumulative EV |
#'  |----------|----------|
#'  | 1 | 0.392 |
#'  | 2 | 0.586 |
#'  | 3 | 0.692 |
#'  | 4 | 0.756 |
#'  | 5 | 0.812 |
#'  | 6 | 0.858 |
#'  | 7 | 0.896 |
#'  | 8 | 0.924 |
#'  | 9 | 0.945 |
#'  | 10 | 0.961 |
#'  | 11 | 0.975 |
#'  | 12 | 0.983 |
#'  | 13 | 0.988 |
#'  | 14 | 0.992 |
#'  | 15 | 0.995 |
#'  | 16 | 0.997 |
#'  | 17 | 0.999 |
#'  | 18 | 1 |
#'  | 19 | 1 |
#'  | 20 | 1 |
#'
#' @format A data frame with with 21 rows and 20 columns
#' @source \url{ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62}
"BLOSUM62_pca"


#' The BLOSUM50 encoding pca matrix
#'
#' The BLOSUM50 matrix transformed for encoding by performing a PCA
#' and then using n number of PCs for encoding. Below table show the
#' cumulative explained variation, such that, e.g. incl. 10 PCs, will
#' correspond to 96% EV.
#'
#' @details
#'  | PC | Cumulative EV |
#'  |----------|----------|
#'  | 1 | 0.375 |
#'  | 2 | 0.565 |
#'  | 3 | 0.661 |
#'  | 4 | 0.744 |
#'  | 5 | 0.802 |
#'  | 6 | 0.852 |
#'  | 7 | 0.89 |
#'  | 8 | 0.918 |
#'  | 9 | 0.945 |
#'  | 10 | 0.96 |
#'  | 11 | 0.973 |
#'  | 12 | 0.981 |
#'  | 13 | 0.987 |
#'  | 14 | 0.991 |
#'  | 15 | 0.995 |
#'  | 16 | 0.997 |
#'  | 17 | 0.999 |
#'  | 18 | 1 |
#'  | 19 | 1 |
#'  | 20 | 1 |
#' @format A data frame with with 21 rows and 20 columns
#' @source \url{ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM50}
"BLOSUM50_pca"

#' The ONEHOT encoding matrix
#'
#' Here, every amino acid residue is simply encoded orthogonal using a
#' diagonal unit matrix
#'
#' @format A data frame with with 21 rows and 21 columns
"ONEHOT_enc"

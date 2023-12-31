% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{BLOSUM50}
\alias{BLOSUM50}
\title{The BLOSUM50 matrix}
\format{
A data frame with with 20 rows and 20 columns
}
\source{
\url{https://ftp.ncbi.nih.gov/blast/matrices/BLOSUM50}
}
\usage{
BLOSUM50
}
\description{
The BLock SUbstition matrix for sequences with less than 50\\% similarity.
The matrix has been subset to the 20 proteogenic amino acids
}
\details{
Matrix made by matblas from blosum50.iij
\itemize{
\item column uses minimum score
}

BLOSUM Clustered Scoring Matrix in 1/3 Bit Units

Blocks Database = /data/blocks_5.0/blocks.dat

Cluster Percentage: >= 50

Entropy =   0.4808, Expected =  -0.3573
}
\keyword{datasets}

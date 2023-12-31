% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{BLOSUM62_pca}
\alias{BLOSUM62_pca}
\title{The BLOSUM62 encoding pca matrix}
\format{
A data frame with with 21 rows and 20 columns
}
\source{
\url{ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62}
}
\usage{
BLOSUM62_pca
}
\description{
The BLOSUM62 matrix transformed for encoding by performing a PCA
and then using n number of PCs for encoding. Below table show the
cumulative explained variation, such that, e.g. incl. 10 PCs, will
correspond to 96.1\% EV.
}
\details{
\tabular{ll}{
   PC \tab Cumulative EV \cr
   1 \tab 0.392 \cr
   2 \tab 0.586 \cr
   3 \tab 0.692 \cr
   4 \tab 0.756 \cr
   5 \tab 0.812 \cr
   6 \tab 0.858 \cr
   7 \tab 0.896 \cr
   8 \tab 0.924 \cr
   9 \tab 0.945 \cr
   10 \tab 0.961 \cr
   11 \tab 0.975 \cr
   12 \tab 0.983 \cr
   13 \tab 0.988 \cr
   14 \tab 0.992 \cr
   15 \tab 0.995 \cr
   16 \tab 0.997 \cr
   17 \tab 0.999 \cr
   18 \tab 1 \cr
   19 \tab 1 \cr
   20 \tab 1 \cr
}
}
\keyword{datasets}

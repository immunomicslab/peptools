% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pep_split.R
\name{pep_split}
\alias{pep_split}
\title{Convert a vector of peptides to matrix form}
\usage{
pep_split(x)
}
\arguments{
\item{x}{A vector of equal length peptides}
}
\value{
A n_pep x l_pep matrix
}
\description{
Convert a vector of peptides to matrix form
}
\examples{
pep_split(x = c("RQGQDHPTM","RGQKTTDNA","NILYEYWDY"))

}

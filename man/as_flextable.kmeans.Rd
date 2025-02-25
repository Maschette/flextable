% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as_flextable.R
\name{as_flextable.kmeans}
\alias{as_flextable.kmeans}
\title{tabular summary for kmeans}
\usage{
\method{as_flextable}{kmeans}(x, digits = 4, ...)
}
\arguments{
\item{x}{a \code{\link[=kmeans]{kmeans()}} object}

\item{digits}{number of digits for the numeric columns}

\item{...}{unused argument}
}
\description{
produce a flextable describing a
kmeans object. The function is only using package 'broom'
that provides the data presented in the resulting flextable.
}
\examples{
if(require("stats")){
  cl <- kmeans(scale(mtcars[1:7]), 5)
  ft <- as_flextable(cl)
  ft
}
}

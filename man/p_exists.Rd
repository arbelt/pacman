% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/p_exists.R
\name{p_exists}
\alias{p_exists}
\title{Checks if Package is On CRAN/In Local Library}
\usage{
p_exists(package, local = FALSE)
}
\arguments{
\item{package}{Name of package.}

\item{local}{logical.  If \code{TRUE} checks user's local library for 
existence; if \code{FALSE} \href{http://cran.r-project.org/}{CRAN} for the 
package.}
}
\description{
Checks CRAN to determine if a package exists.
}
\examples{
\dontrun{
p_exists(pacman)
p_exists(pacman, FALSE)
p_exists(I_dont_exist)
}
}
\keyword{exists}
\keyword{package}

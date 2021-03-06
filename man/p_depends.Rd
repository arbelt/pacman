% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/p_depends.R
\name{p_depends}
\alias{p_depends}
\alias{p_depends_reverse}
\title{Package Dependencies}
\usage{
p_depends(package, local = FALSE, character.only = FALSE, ...)

p_depends_reverse(package, local = FALSE, character.only = FALSE, ...)
}
\arguments{
\item{package}{Name of the package you want the list of dependencies/reverse 
dependencies for.}

\item{local}{logical.  If \code{TRUE} checks user's local library for 
existence; if \code{FALSE} \href{http://cran.r-project.org/}{CRAN} for the 
package.}

\item{character.only}{logical. If \code{TRUE} the input is a variable 
containing the package name.}

\item{\ldots}{other arguments passed to 
\code{\link[tools]{package_dependencies}} and 
\code{\link[tools]{dependsOnPkgs}}.}
}
\value{
Returns a list of dependencies/reverse dependencies.
}
\description{
\code{p_depends} - Get \href{http://cran.r-project.org/}{CRAN} or local 
package dependencies.

\code{p_depends_reverse} - Get \href{http://cran.r-project.org/}{CRAN} or 
local reverse dependencies.
}
\examples{
p_depends(lattice)
p_depends_reverse(lattice)

\dontrun{
## dependencies from CRAN
p_depends(pacman)
p_depends_reverse("pacman")

## local dependencies 
p_depends(pacman, local = TRUE)
p_depends_reverse("qdap", local = TRUE)
}
}
\seealso{
\code{\link[pacman]{p_info}},
\code{\link[tools]{package_dependencies}},
\code{\link[tools]{dependsOnPkgs}}
}
\keyword{dependencies}
\keyword{dependency}

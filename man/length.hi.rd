\name{length.hi}
\alias{length.hi}
\alias{poslength}
\alias{poslength.hi}
\alias{poslength.ri}
\alias{poslength.bit}
\alias{poslength.bitwhich}
\alias{poslength.logical}
\alias{poslength.default}
\alias{maxindex}
\alias{maxindex.hi}
\alias{maxindex.ri}
\alias{maxindex.bit}
\alias{maxindex.bitwhich}
\alias{maxindex.logical}
\alias{maxindex.default}
\title{ Hybrid Index, querying }
\description{
  Functions to query some index attributes
}
\usage{
\method{length}{hi}(x)
maxindex(x, \dots)
poslength(x, \dots)
\method{maxindex}{hi}(x, \dots)
\method{maxindex}{ri}(x, \dots)
\method{maxindex}{bit}(x, \dots)
\method{maxindex}{bitwhich}(x, \dots)
\method{maxindex}{logical}(x, \dots)
\method{maxindex}{default}(x, \dots)
\method{poslength}{hi}(x, \dots)
\method{poslength}{ri}(x, \dots)
\method{poslength}{bit}(x, \dots)
\method{poslength}{bitwhich}(x, \dots)
\method{poslength}{logical}(x, \dots)
\method{poslength}{default}(x, \dots)
}
\arguments{
  \item{x}{ an object of class \code{\link{hi}} }
  \item{\dots}{ further arguments (not used) }
}
\details{
  \command{length.hi} returns the number of the subsript elements in the index (even if they are negative).
  By contrast the generic \command{poslength} returns the number of selected elements (which for negative indices is \code{maxindex(x) - length(unique(x))}).
  The generic \command{maxindex} returns the highest possible index position.
}
\value{
  an integer scalar
}
\author{ Jens Oehlschlägel }
\note{ duplicated negative indices are removed }
\seealso{ \code{\link{hi}}, \code{\link{as.hi}}, \code{\link{length.ff}}, \code{\link{length}} }
\examples{
  length(as.hi(-1, maxindex=12))
  poslength(as.hi(-1, maxindex=12))
  maxindex(as.hi(-1, maxindex=12))
  message("note that")
  length(as.hi(c(-1, -1), maxindex=12))
  length(as.hi(c(1,1), maxindex=12))
}
\keyword{ IO }
\keyword{ data }

\name{physical.ff}
\alias{physical.ff}
\alias{physical<-.ff}
\alias{virtual.ff}
\alias{virtual<-.ff}
\title{ Getting and setting physical and virtual attributes of ff objects }
\description{
  Functions for getting and setting physical and virtual attributes of ff objects.
}
\usage{
\method{physical}{ff}(x)
\method{virtual}{ff}(x)
\method{physical}{ff}(x) <- value
\method{virtual}{ff}(x) <- value
}
\arguments{
  \item{x}{ an ff object }
  \item{value}{ a list with named elements }
}
\details{
  ff objects have physical and virtual attributes, which have different copying semantics:
  physical attributes are shared between copies of ff objects while virtual attributes might differ between copies.
  \code{\link{as.ram}} will retain some physical and virtual atrributes in the ram clone,
  such that \code{\link{as.ff}} can restore an ff object with the same attributes.
}
\value{
  \command{physical} and \command{virtual} returns a list with named elements
}
\author{ Jens Oehlschl�gel }
\seealso{
 \code{\link[bit]{physical}}, \code{\link{physical.ffdf}}, \code{\link{ff}}, \code{\link{as.ram}}; \cr
 \code{\link{is.sorted}} and \code{\link{na.count}} for applications of physical attributes; \cr
 \code{\link{levels.ff}} and \code{\link{ramattribs}} for applications of virtual attributes
}
\examples{
  x <- ff(1:12)
  x
  physical(x)
  virtual(x)
  y <- as.ram(x)
  physical(y)
  virtual(y)
  rm(x,y); gc()
}
\keyword{ IO }
\keyword{ data }
\keyword{ attribute }

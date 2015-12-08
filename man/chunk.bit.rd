\name{chunk.bit}
\Rdversion{1.1}
\alias{chunk.bit}
\title{
   Chunk bit vectors
}
\description{
   chunking method for ffdf objects automatically considering RAM requirements from recordsize as calculated from \code{\link{sum}(\link{.rambytes}[\link[=vmode.ffdf]{vmode}])}
}
\usage{
\method{chunk}{bit}(x, RECORDBYTES = .rambytes["logical"], BATCHBYTES = getOption("ffbatchbytes"), \dots)
}
\arguments{
  \item{x}{\code{\link{bit}}}
  \item{RECORDBYTES}{ optional integer scalar representing the bytes needed to process a single element of the bit vector }
  \item{BATCHBYTES}{ integer scalar limiting the number of bytes to be processed in one chunk, default from \code{getOption("ffbatchbytes")}, see also \code{\link{.rambytes}} }
  \item{\dots}{further arguments passed to \code{\link[bit]{chunk}}}
}
\value{
  A list with \code{\link[bit]{ri}} indexes each representing one chunk
}
\author{
  Jens Oehlschlägel
}
\seealso{ \code{\link[bit]{chunk}}, \code{\link{bit}} }
\examples{
  n <- 1000
  x <- bit(n)
  ceiling(n / (300 \%/\% sum(.rambytes["logical"])))
  chunk(x, BATCHBYTES=300)
  ceiling((n/2) / (100 \%/\% sum(.rambytes["logical"])))
  chunk(x, from=1, to = n/2, BATCHBYTES=100)
  rm(x, n)

}
\keyword{ IO }
\keyword{ data }

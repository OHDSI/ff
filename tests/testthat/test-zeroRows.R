library("testthat")
library("ff")
# options('fftempdir' = '/var/tmp')

test_that("Can create zero length ff objects", {
  x <- as.ff(c(), vmode = "integer")
  expect_equal(length(x), 0)
  expect_equal(vmode(x), "integer")
  
  x <- as.ff(c())
  expect_equal(length(x), 0)
  expect_equal(vmode(x), "logical")
  
  x <- ff(c(), vmode = "integer")
  expect_equal(length(x), 0)
  expect_equal(vmode(x), "integer")
  
  x <- ff(c())
  expect_equal(length(x), 0)
  expect_equal(vmode(x), "logical")
  
  y <- as.ram(x)
  expect_equal(length(y), 0)
  expect_equal(class(y), "logical")
  
  delete(x)
})

test_that("Can clone zero length ff objects", {
  x <- ff(c())
  y <- clone.ff(x)
  
  close.ff(y)
  
  open.ff(y)
  expect_equal(length(y), 0)
  expect_equal(vmode(y), "logical")
})

test_that("Can save zero length ff objects", {
  x <- ff(c())
  ffsave(x, file = "ffTest")
  rm(x)
  ffload("ffTest")
  expect_equal(length(x), 0)
  expect_equal(vmode(x), "logical")
})

test_that("Can create zero row ffdf objects", {
  x <- data.frame(a = c(1,2), b = c(2,3))
  x <- x[x$a == 3,]
  x <- as.ffdf(x)
  
  expect_equal(nrow(x), 0)
  expect_equal(vmode(x)[[1]], "double")
  expect_equal(vmode(x)[[2]], "double")
  
  delete(x)
})

test_that("Can clone zero row ffdf objects", {
  x <- data.frame(a = c(1,2), b = c(2,3))
  x <- x[x$a == 3,]
  x <- as.ffdf(x)
  y <- clone.ffdf(x)
  
  close.ffdf(y)
  
  open.ffdf(y)
  expect_equal(nrow(y), 0)
  expect_equal(vmode(y)[[1]], "double")
  expect_equal(vmode(y)[[2]], "double")
})

test_that("Can save zero row ffdf objects", {
  x <- data.frame(a = c(1,2), b = c(2,3))
  x <- x[x$a == 3,]
  x <- as.ffdf(x)
#   ffbase::save.ffdf(x, dir = "ffdfTest", overwrite = TRUE)
#   rm(x)
#   ffbase::load.ffdf(dir = "ffdfTest")
#   
#   expect_equal(nrow(x), 0)
#   expect_equal(vmode(x)[[1]], "double")
#   expect_equal(vmode(x)[[2]], "double")
#   
  write.csv(x, "test.csv", row.names = FALSE)
  y <- read.csv.ffdf(file = "test.csv")
  file.remove("test.csv")
  expect_equal(nrow(y), 0)
})

test_that("Indexing functions can handle zero rows", {
  b <- as.bit(c())
  expect_equal(length(b), 0)
  expect_equal(class(b), "bit")
  
  x <- as.ff(b)
  expect_equal(length(x), 0)
  expect_equal(vmode(x), "boolean")
  
  b <- as.byte(c())
  expect_equal(length(b), 0)
  expect_equal(class(b), "integer")
  
  x <- as.ff(1:10)
  y <- x[as.hi(c())]
  expect_equal(vmode(x), vmode(y))
  
  
  x <- as.integer.hi(as.hi(c()))
  expect_equal(length(x), 0)
  expect_equal(class(x), "integer")
  
  x <- as.vmode(c(),"double")
  expect_equal(length(x), 0)
  
  x <- as.vmode(c(),"logical")
  expect_equal(length(x), 0)
  
  x <- as.vmode(c(),"byte")
  expect_equal(length(x), 0)
  
  chunks <- chunk(ff(c()))
  expect_equal(length(chunks), 0)
  
  x <- data.frame(a = c(1,2), b = c(2,3))
  x <- x[x$a == 3,]
  x <- as.ffdf(x)
  chunks <- chunk(x)
  expect_equal(length(chunks), 0)
  
  
  x <- data.frame(a = c(1,2), b = c(2,3))
  x <- x[x$a == 3,]
  x <- as.ffdf(x)
  expect_equal(dimnames.ffdf(x)[[2]], c("a","b"))
  
  x <- data.frame(a = c(1,2), b = c(2,3))
  x <- x[x$a == 3,]
  x <- as.ffdf(x)
  ffdfsort(x)
  expect_equal(nrow(x), 0)
  
  x <- ff(c())
  y <- ff(c())
  x <- x[fforder(x,y)]
  expect_equal(length(x), 0)
  
  x <- ff(c())
  x <- ffsort(x)  
  expect_equal(length(x), 0)
  
  
})

test_that("Extract functions can handle zero rows", {
  x <- ff(c())
  expect_equal(length(x[]), 0)
  expect_equal(length(as.vector(x[])), 0)
  expect_equal(length(x[1:10]), 0)
  
  x <- ff(factor(letters))
  y <- ff(1:26)
  d <- ffdf(x,y)
  i <- ff(c(), vmode="integer")
  di <- d[i,]
  expect_equal(nrow(di), 0)
  
  di <- ffdfindexget(d, i, FF_RETURN=di)
  expect_equal(nrow(di), 0)
  
  d2 <- ffdfindexset(d, i, di)
  expect_equal(d, d2)
  
  
  x <- ff(factor(letters))
  i <- ff(c(), vmode="integer")
  xi <- x[i]
  
  expect_equal(length(xi), 0)
  ff()
  xi <- ffindexget(x, i, FF_RETURN=xi)
  expect_equal(length(xi), 0)
  
  x2 <- ffindexset(x, i, xi)
  expect_equal(x, x2)
})

test_that("Can convert to bit and back", {
  l <- c(T,F,T,T,F)
  b <- as.bit(l)
  
  f <- as.ff(b)
  stopifnot(all.equal(l,f[], check.attributes = FALSE))

  b2 <- as.bit(f)
  stopifnot(all.equal(b, b2, check.attributes = FALSE))
  f2 <- as.ff(b2)
  stopifnot(all.equal(l, f2[], check.attributes = FALSE))
  stopifnot(identical(filename(f),filename(f2)))
})

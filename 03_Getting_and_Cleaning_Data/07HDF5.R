##Learn more:
#1. https://www.bioconductor.org/packages/release/bioc/vignettes/rhdf5/inst/doc/rhdf5.html
#2. https://hdfgroup.com/hdf5

##Installing packages
# source("https://bioconductor.org/biocLite.R") #Contains other packages for Genomics
# biocLite("rhdf5")

library(rhdf5)

#Creating HDF5 files with groups----
created = h5createFile("example.h5")
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")
h5ls("example.h5")

#Writing to groups----
A = matrix(1:10, nr=5, nc=2)
h5write(A, "example.h5", "foo/A")

B = array(seq(0.1,2.0,by=0.1), dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")

df = data.frame(1L:5L, seq(0,1,length.out=5), c("ab", "cde", "fgh", "i", "j"), stringsAsFactors = F)
h5write(df, "example.h5", "df")
h5ls("example.h5")

h5write(c(12,13,14), "example.h5", "foo/A", index=list(1:3,1)) #Writing in chunks

#Reading from groups----
readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5", "foo/foobaa/B")
readdf = h5read("example.h5", "df")
readA
readB
readdf

h5read("example.h5", "foo/A", index=list(1:3,1)) #Reading in chunks

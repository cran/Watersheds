\name{Watersheds-package}
\alias{Watersheds-package}
\alias{Watersheds}
\docType{package}
\title{
Spatial watershed aggregation and spatial drainage network analysis
}
\description{
Spatial analysis for watersheds aggregation and ordering accordingly to an outlet point and size of tributary watershed of the current watershed. Spatial drainage networks analysis inside the aggregated watersheds.
}
\details{
\tabular{ll}{
Package: \tab Watersheds\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-08-10\cr
License: \tab GPL (>= 2)\cr
Depends: \tab R (>= 2.10), methods, sp, maptools, rgeos, lattice, splancs, multicore\cr
}
Creation and handling of objects class \code{Watershed} for identifying the subbasin that contains the current \code{station} (class \code{SpatialPoints}) and subsets the \code{zhyd} object to subbasin and extract the current \code{zhy} object that contains \code{station} via the S4 method \code{Watershed.Order}. Identification of the inlet and outlet stretches and inlet and outlet nodes of the \code{zhyd}. Implementation of functions \code{Watershed. ,IOR1, IOR2, IOR3}, and \code{IOR4} for determining the actual inlet and outlet nodes.  S4 methods \code{Watershed.Order2} and \code{Watershed.Tributary} for defining tributary nodes and tributary catchments of the current \code{zhyd} watershed.
}
\author{
J.A. Torres

Maintainer: J.A. Torres <arturo.torres@uni-muenster.de>

}
%\references{
%~~ Literature or other references for background information ~~
%}
%~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation directory ~~
\keyword{ package }
\seealso{
See Also the class \code{\link{Watershed}} and the methods \code{\link{Watershed.Order}}, \code{\link{Watershed.Order2}} and \code{\link{Watershed.Tributary}}.
}
%\examples{

%}

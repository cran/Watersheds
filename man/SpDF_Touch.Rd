\name{SpDF_Touch}
\alias{SpDF_Touch}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Touch function for spatial objects
}
\description{
The SpatialDataFrame Touch function. Identifies which nodes has touching lines and retrives a list with two elements. }
\usage{
SpDF_Touch(x, y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
An spatial object as is described in package \code{sp}.
}
  \item{y}{
An spatial object as is described in package \code{sp}.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
A list with two elements:
  \item{comp1 }{A matrix with the \code{OBJECTID} of the node (column 1), the maximum number of lines that are touching the node (column 2), and the elevation of that node (column 3).
}
  \item{comp2 }{A matrix with the \code{OBJECTID} of the lines that are touching the node.}
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
J.A. Torres
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
library(Watersheds)
data(WatershedsData)

station1 = WatershedsData$station
subbasin1 = WatershedsData$subbasin
zhyd1 = WatershedsData$zhyd
river1 = WatershedsData$river
node1 = WatershedsData$node	

station1 = SpatialPoints(coords=cbind(4328448.74, 3118576.86), 
	proj4string=slot(subbasin1,"proj4string"))
watershed = new("Watershed",station=station1,subbasin=subbasin1,
	zhyd=zhyd1,river=river1,c1=subbasin1,node=node1)

a = Watershed.Order(watershed)
c1 = a[[1]]
riverIO = a[[8]]
nodeIO = a[[9]]			

touch = SpDF_Touch(nodeIO, riverIO)
touch1 = touch[[1]]; touch1
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ SpDF_Touch }
\keyword{ Touch }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

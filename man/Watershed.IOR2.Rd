\name{Watershed.IOR2}
\alias{Watershed.IOR2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Watershed inlet and outlet nodes: case 2
}
\description{
The function determines the inlet and outlet nodes for \code{zhyd} watershed objects. This case 2 is for those watersheds that its river inlet and outlet object is length 2 (length(riverIO)=2).
}
\usage{
Watershed.IOR2(x, dist, node)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
An object \code{"SpatialPointsDataFrame"} or \code{"SpatialPoints"} as are described in package \code{sp} over the function will search the inlet and outlet nodes of the watershed.
}
  \item{dist}{
A vector with the distances of each point in \code{x} to the current {zhyd} boundary.
}
  \item{node}{
An object \code{"SpatialPointsDataFrame"} as are described in package \code{sp} over the function will search the inlet and outlet nodes of the watershed. It must be the entire node search object.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
A list of length 2:
\item{inlet }{A \code{"SpatialPointsDataFrame"} that represents the inlet node of the current \code{zhyd}.}
\item{outlet }{A \code{"SpatialPointsDataFrame"} that represents the outlet node of the current \code{zhyd}.}
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
J.A. Torres
}
\note{
If there are not inlet or outlet node of the current \code{zhyd} is returned 0.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
See Also the functions \code{\link{Watershed.IOR1}}, \code{\link{Watershed.IOR3}}, \code{\link{Watershed.IOR4}}.
}
\examples{
library(Watersheds)
data(WatershedsData)

station1 = WatershedsData$station
subbasin1 = WatershedsData$subbasin
zhyd1 = WatershedsData$zhyd
river1 = WatershedsData$river
node1 = WatershedsData$node	

station1 = SpatialPoints(coords=cbind(4330341.36,3284797.06), 
	proj4string=slot(subbasin1,"proj4string"))
watershed = new("Watershed",station=station1,subbasin=subbasin1,
	zhyd=zhyd1,river=river1,c1=subbasin1,node=node1)

a = Watershed.Order(watershed)
c1 = a[[1]]
nodeIO = a[[9]]			
c1_river = a[[10]]
c1_node = a[[11]]	
		
# determining inlet and outlet watershed nodes
	# determining distances of nodeIO to c1
	boundary = gBoundary(c1)
	dist = gDistance(nodeIO, boundary, byid =TRUE)
	a = Watershed.IOR2(x=nodeIO, dist=dist, node=c1_node)
	str(a)		
	c1_inlet = a$inlet; c1_inlet
	c1_outlet = a$outlet; c1_outlet
	
plot(c1,col="gray60")			
plot(station1,pch=24, bg="blue",add= TRUE)
plot(c1_river, col="blue", add=TRUE)
plot(c1_outlet,pch=21, bg="red",add= TRUE)
plot.PointAttribute(c1_outlet,"ELEV",700,0.8)
title(main="Watershed outlet, case II")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Watershed.IOR2 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

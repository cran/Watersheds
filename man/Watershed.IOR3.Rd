\name{Watershed.IOR3}
\alias{Watershed.IOR3}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Watershed inlet and outlet nodes: case 3
}
\description{
The function determines the inlet and outlet nodes for \code{zhyd} watershed objects. This case 3 is for those watersheds that its river inlet and outlet object is length 3 (length(riverIO)=3).
}
\usage{
Watershed.IOR3(x, y, dist)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
An object \code{"SpatialPointsDataFrame"} as is described in package \code{sp} over them the function will search the inlet and outlet nodes of the watershed.
}
  \item{y}{
An object \code{"SpatialLinesDataFrame"} as is described in package \code{sp} that  represents the inlet and outlet rivers of the watershed.
}
  \item{dist}{
A vector with the distances of each point in \code{x} to the current {zhyd} boundary.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
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
See Also the functions \code{\link{Watershed.IOR1}}, \code{\link{Watershed.IOR2}}, \code{\link{Watershed.IOR4}}.
}
\examples{
library(Watersheds)
data(WatershedsData)

station1 = WatershedsData$station
subbasin1 = WatershedsData$subbasin
zhyd1 = WatershedsData$zhyd
river1 = WatershedsData$river
node1 = WatershedsData$node	

station1 = SpatialPoints(coords=cbind(4217199.42,3353511.83), 
	proj4string=slot(subbasin1,"proj4string"))
watershed = new("Watershed",station=station1,subbasin=subbasin1,
	zhyd=zhyd1,river=river1,c1=subbasin1,node=node1)

a = Watershed.Order(watershed)
c1 = a[[1]]
riverIO = a[[8]]
nodeIO = a[[9]]			
c1_river = a[[10]]
		
# determining inlet and outlet watershed nodes
	# determining distances of nodeIO to c1
	boundary = gBoundary(c1)
	dist = gDistance(nodeIO, boundary, byid =TRUE)
	a = Watershed.IOR3(x=nodeIO, y=riverIO, dist=dist)	
	c1_inlet = a$inlet; c1_inlet
	c1_outlet = a$outlet; c1_outlet
	
plot(c1,col="gray60")			
plot(station1,pch=24, bg="blue",add= TRUE)
plot(c1_river, col="blue", add=TRUE)
plot(c1_outlet,pch=21, bg="red",add= TRUE)
plot(c1_inlet,pch=21, bg="green",add= TRUE)
plot.PointAttribute(c1_outlet,"ELEV",1000,0.8)
plot.PointAttribute(c1_inlet,"ELEV",1000,0.8)
title(main="Watershed outlet and inlet, case III")
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Watershed.IOR3 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

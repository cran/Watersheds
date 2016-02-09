\name{Watershed}
\Rdversion{1.1}
\docType{class}
\alias{Watershed-class}
\alias{Watershed}

\title{Class \code{"Watershed"}}
\description{
A S4 class \code{"Watershed"} for representing \code{"Watershed"} objects.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("Watershed", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{station}:}{Object of class \code{"SpatialPoints"} of length 1. Represents a point from which aggregation fo watersheds will occur.}
    \item{\code{subbasin}:}{Object of class \code{"SpatialPolygonsDataFrame"} of length 1. Represents the current boundary of the hydrological units or \code{zhyd} objects.}
    \item{\code{zhyd}:}{Object of class \code{"SpatialPolygonsDataFrame"}. Represents the current hydrological units (zhyd accordingly to ECRINS (EAA, 2012)) to be analized inside the subbasin boundary.}
    \item{\code{river}:}{Object of class \code{"SpatialLinesDataFrame"} that represents the current river network to be analised inside the subbasin boundary. }
    \item{\code{c1}:}{Object of class \code{"SpatialPolygonsDataFrame"} of lentgh 1. Represents the curren \code{zhyd} object of analysis. }
    \item{\code{node}:}{Object of class \code{"SpatialPointsDataFrame"}. Represents the current nodes of the river network to be analised inside the subbasin boundary. }
  }
}
\section{Methods}{
  \describe{
    \item{Watershed.Order}{\code{signature(x = "Watershed")}: ... }
    \item{Watershed.Order2}{\code{signature(watershed = "Watershed")}: ... }
    \item{Watershed.Tributary}{\code{signature(x = "SpatialPointsDataFrame", xo = "SpatialPointsDataFrame", y = "SpatialLinesDataFrame", z = "SpatialPointsDataFrame", zhyd = "SpatialPolygonsDataFrame", c1 = "SpatialPolygonsDataFrame")}}
	 }
}
\references{
European Environment Agency - EAA. (2012). EEA catchments and rivers network system, ECRINS v1.1. rationales, building and improving for widening uses to Water Accounts and WISE applications (EEA Technical report No. 7/2012). (Luxembourg: Publications Office of the European Union).}
\author{
J.A. Torres-Matallana
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
See Also as the functions \code{\link{Watershed.IOR1}},
\code{\link{Watershed.IOR2}}, \code{\link{Watershed.IOR3}},  
\code{\link{Watershed.IOR4}}, or the S4 methods
\code{\linkS4class{Watershed.Order}}, 
\code{\linkS4class{Watershed.Order2}}, 
\code{\linkS4class{Watershed.Tributary}}
}
\examples{
	data(WatershedsData)
	station1 = WatershedsData$station
	subbasin1 = WatershedsData$subbasin
	zhyd1 = WatershedsData$zhyd
	river1 = WatershedsData$river
	node1 = WatershedsData$node	
	
	station1 = SpatialPoints(coords=slot(station1,"coords"), 
		proj4string=slot(subbasin1,"proj4string"))
	watershed = new("Watershed",station=station1,subbasin=subbasin1,
		zhyd=zhyd1,river=river1,c1=subbasin1,node=node1)
}
\keyword{classes}
\keyword{Watershed}
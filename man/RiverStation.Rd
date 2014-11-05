\name{RiverStation}
\alias{RiverStation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
	Intersection of \code{SpatialPoints} and \code{SpatialLinesDataFrame}
}
\description{
The function intersects objects \code{SpatialPoints} and \code{SpatialLinesDataFrame}.
Identyfies the closer stretch(es) to a station. The \code{SpatialPoints} must 
be length 1.	
}
\usage{
RiverStation(x, y, window = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
 An object of class \code{SpatialPoints} as is defined in package \code{sp} and length 1.
}
  \item{y}{
 An object of class \code{SpatialLinesDataFrame} as is defined in package \code{sp}.
}
  \item{window}{
 A numeric value that represents the size of the square (window) around the \code{x} object.
}
}
\details{
\code{window} value magnifies the object \code{x} in order to certainly secure the intersection
with the object \code{y}. The greater value the more intersection area is defined.
}
\value{
An object \code{SpatialLinesDataFrame} that is  a subsect of th object \code{x} that represents
the current intersection withe object \code{x}.
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
river1 = WatershedsData$river

tributary = RiverStation(station1, river1)
plot(tributary, col="blue")
plot(station1,pch=21,bg="red",cex=.8,add=TRUE)
plot.PolyLineAttribute(x=tributary, y="OBJECTID", dist=100, cex=.8)
title(main="Point station and tributary rivers")}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ RiverStation }

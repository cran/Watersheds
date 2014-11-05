\name{Watershed.Order-methods}
\docType{methods}
\alias{Watershed.Order-methods}
\alias{Watershed.Order,Watershed-method}
\alias{Watershed.Order}
\alias{Watershed.Order-class}
\title{ S4 Method for Function \code{Watershed.Order}}
\description{
 S4 Method for function \code{Watershed.Order}. Definition of the properties of the current \code{zhyd} watershed.
}
\section{Methods}{
\describe{

\item{\code{signature(x = "Watershed")}}{
The function takes the object of class \code{Watershed} and identifies the subbasin that contains the current \code{station} (class \code{SpatialPoints}) and subsets the \code{zhyd} object to subbasin and extract the current \code{zhy} object that contains \code{station}. Posteriorly, identifies the inlet and outlet stretches and probable inlet and outlet nodes of the \code{zhyd}. Then, runs the functions \code{Watershed. ,IOR1, IOR2, IOR3}, or \code{IOR4} for determining the actual inlet and outlet nodes. Finally, the method executes the S4 method \code{Watershed.Tributary} for defining tributary nodes and tributary catchments of the current \code{zhyd} watershed.}
}
}   
\value{
The method returns a list of 11 objects:

  \item{c1}{An object \code{SpatialPolygonsDataFrame} of length 1 that represents the current \code{zhyd} watershed object.}
  \item{c1_inlet}{An object \code{SpatialPointsDataFrame} of length 1 that represents the current inlet node of the \code{zhyd} watershed object.}
  \item{c1_outlet}{An object \code{SpatialPointsDataFrame} of length 1 that represents the current outlet node of the \code{zhyd} watershed object.}
  \item{c2}{An object \code{SpatialPolygonsDataFrame} of length 1 that represents the greater watershed tributary of the current \code{zhyd} watershed object.}
  \item{c3}{An object \code{SpatialPolygonsDataFrame} of length 1 that represents the second watershed tributary of the current \code{zhyd} watershed object.}
  \item{node_trib}{An object \code{SpatialPointsDataFrame} of length 2 that represents the station points of the tributary watershed objects.}
  \item{sb1}{An object \code{SpatialPointsDataFrame} of length 1 that represents the subbasin that contains the current \code{zhyd} watershed object.}
  \item{riverIO}{An object \code{SpatialLinesDataFrame} that represents the inlet (I) and outlet (O) rivers that crosses the boundary of the current \code{zhyd} watershed object.}
  \item{nodeIO}{An object \code{SpatialPointsDataFrame} that represents the nodes of the inlet (I) and outlet (O) rivers that crosses the boundary of the current \code{zhyd} watershed object.}
  \item{c1_river}{An object \code{SpatialLinesDataFrame} that represents the river network inside the current \code{zhyd} watershed object.}
  \item{c1_node}{An object \code{SpatialPointsDataFrame} that represents the node network inside the current \code{zhyd} watershed object.}
}
\seealso{
See Also the class \code{\link{Watershed}} and the methods \code{\link{Watershed.Order2}} and \code{\link{Watershed.Tributary}}.
}
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
c1_inlet = a[[2]]
c1_outlet = a[[3]]
c2 = a[[4]]
c3 = a[[5]]
node_trib = a[[6]]
sb1 = a[[7]]
riverIO = a[[8]]
nodeIO = a[[9]]			
c1_river = a[[10]]
c1_node = a[[11]]	

bbox1 = slot(c1, "bbox")
bbox = matrix(0,2,2)
bbox[,1] = bbox1[,1]*.998
bbox[,2] = bbox1[,2]*1.002

plot(c1, xlim=bbox[1,], ylim=bbox[2,],col="gray50")			
plot(c2, col="gray75", add=TRUE)
plot(c3, col="gray85", add=TRUE)
plot(slot(watershed,"station"),pch=24, bg="blue",add= TRUE)
plot.PolyLineAttribute(c1, "order", 450, 0.8)
plot.PolyLineAttribute(c2, "order", 450, 0.8)
plot.PolyLineAttribute(c3, "order", 450, 0.8)				
plot(c1_river, col="blue", add=TRUE)
plot(c1_node,pch=21,bg="blue",cex=.5,add=TRUE)
plot(nodeIO,pch=21,bg="blue",cex=.5,add=TRUE)
plot(c1_inlet, pch=21, bg="green",add= TRUE)
plot(c1_outlet,pch=21, bg="red",add= TRUE)
plot.PointAttribute(nodeIO,"ELEV",600,0.7)
title(main="Current zhyd watershed (1)",
	sub="First order tributary watersheds (1.1, 1.2)")
}
\keyword{methods}
\keyword{Watershed.Order}
%\keyword{ ~~ other possible keyword(s) ~~ }

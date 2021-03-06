\name{Watershed.Order2-methods}
\docType{methods}
\alias{Watershed.Order2-methods}
\alias{Watershed.Order2,Watershed-method}
\alias{Watershed.Order2}
\alias{Watershed.Order2-class}
\title{S4 Method for Function \code{Watershed.Order2}}
\description{
 S4 Method for function \code{Watershed.Order2}. Definition of the tributary \code{zhyd} watersheds of the current \code{zhyd} watershed.
}
\section{Methods}{
\describe{

\item{\code{signature(watershed = "Watershed")}}{
The method takes the objec of class \code{Watershed} when object \code{node_trib} is length 2. The method identifies the \code{zhyd} watershed that contaions the current \code{station} (class \code{SpatialPoints}) and apply the method \code{Watershed.Order} on each point of \code{node_trib} returning a list of objects \code{Watershed.Order}. The computation is done via parallel processes for optimizing and take advance of multicore functionalities.
}
}}
\value{
The method returns a list of 2 objects:

  \item{c2}{An object with the output of the method \code{Watershed.Order} of length 11 for one of the points of \code{node_trib}. The properties of the greater tributary watershed of the current \code{zhyd} watershed.}
  \item{c3}{An object with the output of the method \code{Watershed.Order} of length 11 for the other points of \code{node_trib}. The properties of the second tributary watershed of the current \code{zhyd} watershed.}
}
\seealso{
See Also the class \code{\link{Watershed}} and the methods \code{\link{Watershed.Order}} and \code{\link{Watershed.Tributary}}.
}
\examples{
library(Watersheds)
data(WatershedsData)

station1 = WatershedsData$station
subbasin1 = WatershedsData$subbasin
zhyd1 = WatershedsData$zhyd
river1 = WatershedsData$river
node1 = WatershedsData$node	

station1 = SpatialPoints(coords=cbind(4328650,3174450), 
	proj4string=slot(subbasin1,"proj4string"))
watershed = new("Watershed",station=station1,subbasin=subbasin1,
	zhyd=zhyd1,river=river1,c1=subbasin1,node=node1)

a = Watershed.Order(watershed)
c1 = a[[1]]
node_trib = a[[6]]
c1_river = a[[10]]

nt = node_trib
sb = subbasin1
z1 = zhyd1
r1 = river1
n1 = node1

watershed2 = new("Watershed", station=nt, subbasin=sb, zhyd=z1, river=r1, c1=c1,node=n1)
c23 = Watershed.Order2(watershed2)
c2 = c23[[1]]
c3 = c23[[2]]	

c2.0 = c2[[1]]
c2_inlet = c2[[2]]
c2_outlet = c2[[3]]
c2.1 = c2[[4]]
c2.2 = c2[[5]]
c2_node_trib = c2[[6]]
c2_sb1 = c2[[7]]
c2_riverIO = c2[[8]]
c2_nodeIO = c2[[9]]			
c2_river = c2[[10]]
c2_node = c2[[11]]	
		
c3.0 = c3[[1]]
c3_inlet = c3[[2]]
c3_outlet = c3[[3]]
c3.1 = c3[[4]]
c3.2 = c3[[5]]
c3_node_trib = c3[[6]]
c3_sb1 = c3[[7]]
c3_riverIO = c3[[8]]
c3_nodeIO = c3[[9]]			
c3_river = c3[[10]]
c3_node = c3[[11]]	

# subsetting river networks
id = list(gIntersects(c2.1, WatershedsData$river,byid=TRUE))
c21_river = SpDF_Subset(id,WatershedsData$river)

id = list(gIntersects(c2.2, WatershedsData$river,byid=TRUE))
c22_river = SpDF_Subset(id,WatershedsData$river)

id = list(gIntersects(c3.1, WatershedsData$river,byid=TRUE))
c31_river = SpDF_Subset(id,WatershedsData$river)

id = list(gIntersects(c3.2, WatershedsData$river,byid=TRUE))
c32_river = SpDF_Subset(id,WatershedsData$river)


# plots
bbox1 = slot(c3.2, "bbox")
bbox = matrix(0,2,2)
bbox[,1] = bbox1[,1]*.995
bbox[,2] = bbox1[,2]*1.005
						
plot(c1, col="gray50", xlim=bbox[1,], ylim=bbox[2,])	
plot(c2.0, col = "gray95", add=TRUE)
plot(c3.0, col="gray79", add=TRUE)
plot(c2.1, col="gray78", add=TRUE)
plot(c2.2, col="gray85", add=TRUE)
plot(c3.1, col="gray53", add=TRUE)
plot(c3.2, col="gray63", add=TRUE)

plot(c1_river, col="blue",add=TRUE)		
plot(c2_river, col="blue",add=TRUE)		
plot(c3_river, col="blue",add=TRUE)			
plot(c21_river, col="blue",add=TRUE)			
plot(c22_river, col="blue",add=TRUE)			
plot(c31_river, col="blue",add=TRUE)			
plot(c32_river, col="blue",add=TRUE)
}
\keyword{methods}
\keyword{Watershed.Order2}


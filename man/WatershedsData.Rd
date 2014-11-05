\name{WatershedsData}
\alias{WatershedsData}
\docType{data}
\title{
A dataset of the ECRINS database for the river Weser basin, Germany.
}
\description{
The European Environment Agency (EEA) has been developed the Catchments and Rivers Network System (ECRINS) version 1.1. The ECRINS is the hydrographical system currently in use at the European level as well as widely serving as the reference system for the Water Information System (WISE) (EEA,2012). The current version of ECRINS is based on previous work carried out by the Joint Research Centre (JRC) Catchment Characterisation and Modelling (CCM) and the EEA (European Lakes, Dams and Reservoirs Database (Eldred2), European Rivers and Catchments (ERICA)), (EEA,2012).
}
\usage{data(WatershedsData)}
\section{format}{
	\describe{
\item{\code{basin}:}{ an object \code{SpatialPolygonsDataFrame} as is defined in package \code{sp} that represents the river Weser basin. The \code{data} slot contains 6 variables as attributes of 1 obaservation.}
	
\item{\code{ctry:}}{ an object \code{SpatialPolygonsDataFrame} as is defined in package \code{sp} that represents the administrative boundary of Germany. The \code{data} slot contains 6 variables as attributes of 1 obaservation.}
	
\item{\code{node:}}{ an object \code{SpatialPointsDataFrame} as is defined in package \code{sp} that represents the nodes of the ECRINS river network of the river Weser basin. The \code{data} slot contains 13 variables as attributes of 3882 obaservations.}
	
\item{\code{rAller}}{ an object \code{SpatialLinesDataFrame} as is defined in package \code{sp} that represents the basin of the river Aller, a major tributary of the river Weser. The \code{data} slot contains 74 variables as attributes of 88 observations.}
	
\item{\code{rDiemel}}{ an object \code{SpatialLinesDataFrame} as is defined in package \code{sp} that represents the basin of the river Diemel, a major tributary of the river Weser. The \code{data} slot contains 74 variables as attributes of 39 observations.}
	
\item{\code{rFulda}}{ an object \code{SpatialLinesDataFrame} as is defined in package \code{sp} that represents the basin of the river Fulda, a major tributary of the river Weser. The \code{data} slot contains 74 variables as attributes of 82 observations.}
	
\item{\code{rHunte}}{ an object \code{SpatialLinesDataFrame} as is defined in package \code{sp} that represents the basin of the river Hunte, a major tributary of the river Weser. The \code{data} slot contains 74 variables as attributes of 34 observations.}
	
\item{\code{river}}{ an object \code{SpatialLinesDataFrame} as is defined in package \code{sp} that represents the ECRINS river network of the river Weser basin. The \code{data} slot contains 52 variables as attributes of 3874 observations.}
	
\item{\code{rWerra}}{ an object \code{SpatialLinesDataFrame} as is defined in package \code{sp} that represents the basin of the river Werra, a major tributary of the river Weser. The \code{data} slot contains 74 variables as attributes of 120 observations.}

\item{\code{rWeser}}{ an object \code{SpatialLinesDataFrame} as is defined in package \code{sp} that represents the basin of the river Weser. The \code{data} slot contains 74 variables as attributes of 104 observations.}

\item{\code{rWiumme}}{ an object \code{SpatialLinesDataFrame} as is defined in package \code{sp} that represents the basin of the river Wiumme, a major tributary of the river Weser. The \code{data} slot contains 74 variables as attributes of 18 observations.}

\item{\code{station}}{ an object \code{SpatialPoints} as is defined in package \code{sp} that represents a point of interest for which the watershed will be aggregated an ordered. Could be a point with the coordinates of a measurement station.}

\item{\code{subbasin}}{ an object \code{SpatialPolygonsDataFrame} as is defined in package \code{sp} that represents the subbasins of the tributaries of the river Weser. The \code{data} slot contains 4 variables as attributes of 4 observations.}

\item{\code{zhyd}}{ an object \code{SpatialPolygonsDataFrame} as is defined in package \code{sp} that contains the primary hydrological units of the river Weser basin accordingly with ECRINS. The \code{data} slot contains 50 variables as attributes and 915 observations.}		
	}
}
%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%}
%\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
\references{
European Environment Agency - EAA. (2012). EEA catchments and rivers network system, ECRINS v1.1. rationales, building and improving for widening uses to Water Accounts and WISE applications (EEA Technical report No. 7/2012). (Luxembourg: Publications Office of the European Union).
}
\examples{
data(WatershedsData)

	# plotting river Weser basin
	plot(WatershedsData$ctry)
	plot(WatershedsData$basin, col="green4", add=TRUE)
	title("River Weser basin, Germany")

	# plotting river Weser basin
	plot(WatershedsData$ctry)
	plot(WatershedsData$basin, col="green4", add=TRUE)
	title("River Weser basin, Germany")

	# plotting subbasins river Weser basin
	plot(WatershedsData$basin)
	plot(WatershedsData$subbasin, col="green3",add=TRUE)
	plot(WatershedsData$rWeser,col="blue",lwd=2,add=TRUE)
	plot(WatershedsData$rAller,col="blue",lwd=1,add=TRUE)
	plot(WatershedsData$rDiemel,col="blue",lwd=1,add=TRUE)
	plot(WatershedsData$rFulda,col="blue",lwd=1,add=TRUE)
	plot(WatershedsData$rHunte,col="blue",lwd=1,add=TRUE)
	plot(WatershedsData$rWerra,col="blue",lwd=1,add=TRUE)
	plot(WatershedsData$rWiumme,col="blue",lwd=1,add=TRUE)
	title("Subbasins River Weser")

	# plotting primary zhyd watersheds and drainage network inside river Werra subbasin
	# subsetting the river Werra subbasin
	id = list(gIntersects(WatershedsData$rWerra, WatershedsData$subbasin,byid=TRUE))
	subbasin_rWerra = SpDF_Subset(id,WatershedsData$subbasin)
	plot(subbasin_rWerra)
	
	# subsetting the river Werra zhyd watersheds
	id = list(gIntersects(WatershedsData$rWerra, WatershedsData$zhyd,byid=TRUE))
	zhyd_rWerra = SpDF_Subset(id,WatershedsData$zhyd)
	plot(WatershedsData$rWerra,col="blue",lwd=1,add=TRUE)
	plot(zhyd_rWerra,col="green3",add=TRUE)
	title("Subbasin River Weser and primary zhyd watersheds")

	# subsetting the river Werra river drainage watersheds
	id = list(gIntersects(subbasin_rWerra, WatershedsData$river,byid=TRUE))
	river_rWerra = SpDF_Subset(id,WatershedsData$river)
	plot(subbasin_rWerra)
	plot(WatershedsData$rWerra,col="blue",lwd=3,add=TRUE)
	plot(river_rWerra,col="blue1",add=TRUE)
	title("Subbasin River Weser and drainage network")
}
\keyword{datasets}

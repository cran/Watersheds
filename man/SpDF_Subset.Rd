\name{SpDF_Subset}
\alias{SpDF_Subset}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Subsetting spatial dataframe objects
}
\description{
Given and list \code{x} of logical values, the function subsets the object \code{z} accordingly the TRUE values of \code{x}.
}
\usage{
SpDF_Subset(x, y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A list of logical values where TRUE values indicates the index of the subset.
}
  \item{y}{
 A spatial object as is defined in package \code{sp} from extracting the subset.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
A spatial object of the same class of \code{y}.
}
% \references{
% %% ~put references to the literature/web site here ~
% }
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
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Subset }
\keyword{ SpDF_Subset }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

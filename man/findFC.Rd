% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Find_FC.R
\name{findFC}
\alias{findFC}
\title{findFC}
\usage{
findFC(SCdat, index, sd.range = c(1, 3), N = 4, overExpressionProb = 0.5,
  plot.FC = FALSE, condition = "condition")
}
\arguments{
\item{SCdat}{An object of class \code{SummarizedExperiment} that contains 
normalized single-cell expression and metadata. The \code{assays} 
  slot contains a named list of matrices, where the normalized counts are 
  housed in the one named \code{"NormCounts"}.  This matrix should have one
   row for each gene and one sample for each column.  
  The \code{colData} slot should contain a data.frame with one row per 
  sample and columns that contain metadata for each sample.  This data.frame
  should contain a variable that represents biological condition, which is 
  in the form of numeric values (either 1 or 2) that indicates which 
  condition each sample belongs to (in the same order as the columns of 
  \code{NormCounts}).  Optional additional metadata about each cell can also
  be contained in this data.frame, and additional information about the 
  experiment can be contained in the \code{metadata} slot as a list.}

\item{index}{Reasonable set of genes for simulation}

\item{sd.range}{Numeric vector of length two which describes the interval
(lower, upper) of standard deviations
of fold changes to randomly select.}

\item{N}{Integer value for the number of bins to divide range of fold 
changes for calculating standard deviations}

\item{overExpressionProb}{Numeric value between 0 and 1 which describes 
the ratio of over to under expression 
 values to sample.}

\item{plot.FC}{Logical indicating whether or not to plot the observed 
and simulated log2 fold changes.}

\item{condition}{A character object that contains the name of the column in 
\code{colData} that represents 
 the biological group or condition of interest (e.g. treatment versus 
 control).  Note that this variable should only contain two 
 possible values since \code{scDD} can currently only handle two-group 
 comparisons.  The default option assumes that there
 is a column named "condition" that contains this variable.}
}
\value{
FC.vec Return Fold Change Vectors
}
\description{
Find the appropriate Fold Change vectors for simulation that will be use in
 classic differential expression case.
}
\details{
This code is a modified version of Sam Younkin's simulate FC 
function.  Major things that were changed are 
  (1) standard deviations are calculated only on the nonzeroes, (2) the
   sampling of FCs is uniform on the log scale 
  instead of the raw scale, and (3) the binning is done by quantiles 
  instead of evenly spaced along the average expression
  values.
}
\references{
Korthauer KD, Chu LF, Newton MA, Li Y, Thomson J, Stewart R, 
Kendziorski C. A statistical approach for identifying differential 
distributions
in single-cell RNA-seq experiments. Genome Biology. 2016 Oct 25;17(1):222. 
\url{https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-
1077-y}
}

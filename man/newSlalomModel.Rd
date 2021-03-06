% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SlalomModel-methods.R
\name{newSlalomModel}
\alias{newSlalomModel}
\title{Create a new SlalomModel object.}
\usage{
newSlalomModel(object, genesets, n_hidden = 5, prune_genes = TRUE,
  min_genes = 15, design = NULL, anno_fpr = 0.01, anno_fnr = 0.001,
  assay_name = "logcounts", verbose = TRUE)
}
\arguments{
\item{object}{\code{"SingleCellExperiment"} object N x G expression data matrix (cells x genes)}

\item{genesets}{a \code{"GeneSetCollection"} object containing annotated
gene sets}

\item{n_hidden}{number of hidden factors to fit in the model (2-5 recommended)}

\item{prune_genes}{logical, should genes that are not annotated to any gene
sets be filtered out? If \code{TRUE}, then any genes with zero variance in
expression are also filtered out.}

\item{min_genes}{scalar, minimum number of genes required in order to retain
a gene set for analysis}

\item{design}{numeric design matrix providing values for covariates to fit in
the model (rows represent cells)}

\item{anno_fpr}{numeric(1), false positive rate (FPR) for assigning genes to
factors (pathways); default is 0.01}

\item{anno_fnr}{numeric(1), false negative rate (FNR) for assigning genes to
factors (pathways); default is 0.001}

\item{assay_name}{character(1), the name of the \code{assay} of the
\code{object} to use as expression values. Default is \code{logcounts},
assumed to be normalised log2-counts-per-million values or equivalent.}

\item{verbose}{logical(1), should information about what's going be printed
to screen?}
}
\value{
a new Rcpp_SlalomModel object
}
\description{
Slalom fits relatively complicated hierarchical Bayesian factor analysis
models with data and results stored in a \code{"SlalomModel"} object. This
function builds a new \code{"SlalomModel"} object from minimal inputs.
}
\details{
This function builds and returns the object, checking for validity, which
includes checking that the input data is of consistent dimensions.
}
\examples{
gmtfile <- system.file("extdata", "reactome_subset.gmt", package = "slalom")
genesets <- GSEABase::getGmt(gmtfile)
data("mesc")
model <- newSlalomModel(mesc, genesets, n_hidden = 5, min_genes = 10)

exprsfile <- system.file("extdata", "mesc.csv", package = "slalom")
mesc_mat <- as.matrix(read.csv(exprsfile))
sce <- SingleCellExperiment::SingleCellExperiment(assays = list(logcounts = mesc_mat))
# model2 <- newSlalomModel(mesc_mat, genesets, n_hidden = 5, min_genes = 10)

}

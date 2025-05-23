% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/l_ae_slide.R
\name{l_ae_slide}
\alias{l_ae_slide}
\title{Adverse Events listing
adapted from https://insightsengineering.github.io/tlg-catalog/stable/listings/adverse-events/ael02.html}
\usage{
l_ae_slide(adsl, adae)
}
\arguments{
\item{adsl}{ADSL data}

\item{adae}{ADAE data}
}
\description{
Adverse Events listing
adapted from https://insightsengineering.github.io/tlg-catalog/stable/listings/adverse-events/ael02.html
}
\examples{
library(dplyr)
library(rlistings)
adsl <- eg_adsl
adae <- eg_adae

out <- l_ae_slide(adsl = adsl, adae = adae)
head(out)
}

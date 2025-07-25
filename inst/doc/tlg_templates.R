## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----include = TRUE, eval = FALSE---------------------------------------------
# setwd("~/path/to/autoslider.core")
# 
# devtools::load_all()
# 
# list_all_templates()

## ----eval = TRUE, include = FALSE---------------------------------------------
# hidden setup
# Install and load the necessary packages
library(yaml)
library(assertthat)
library(tern)

# Create the YAML content
yaml_content <- '
ITT:
  title: Intent to Treat Population
  condition: ITTFL == "Y"
  target: adsl
  type: slref
SAS:
  title: Secondary Analysis Set
  condition: SASFL == "Y"
  target: adsl
  type: slref
SE:
  title: Safety Evaluable Population
  condition: SAFFL== "Y"
  target: adsl
  type: slref
SER:
  title: Serious Adverse Events
  condition: AESER == "Y"
  target: adae
  type: anl
LBCRP:
  title: CRP Values
  condition: PARAMCD == "CRP"
  target: adlb
  type: slref
LBNOBAS:
  title: Only Visits After Baseline
  condition: ABLFL != "Y" & !(AVISIT %in% c("SCREENING", "BASELINE"))
  target: adlb
  type: slref
'

# Create a temporary YAML file
filters <- tempfile(fileext = ".yaml")

# Write the YAML content to the temporary file
write(yaml_content, file = filters)

# Create the specs entry
specs_entry <- '
- program: t_ds_slide
  titles: Patient Disposition ({filter_titles("adsl")})
  footnotes: "t_ds footnotes"
  paper: L6
  suffix: ITT
- program: t_dm_slide
  titles: Patient Demographics and Baseline Characteristics
  footnotes: "t_dm_slide footnote"
  paper: L6
  suffix: ITT
  args:
    arm: "TRT01A"
    vars: ["SEX", "AGE", "RACE"]
'

# Create a temporary specs entry file
spec_file <- tempfile(fileext = ".yaml")

# Write the specs entry to the temporary file
write(specs_entry, file = spec_file)

# This chunk runs first and prepares the environment for the whole document

# 1. Load ALL necessary packages
library(rtables)      # For append_topleft()
library(dplyr)       # For %>% and other functions
library(assertthat)   # For assert_that() you had issues with before
# ... add any other packages your report uses

# 3. Load any data files needed
# data <- read.csv(here("data", "my_data.csv"))

# Clean up the temporary files
# file.remove(filters)
# file.remove(spec_file)

## ----include = TRUE-----------------------------------------------------------
library(dplyr)
library(autoslider.core)
demography <- function(adsl,
                       arm = "TRT01P",
                       vars = c("AGE", "SEX", "RACE"),
                       stats = c("median", "range", "count_fraction"),
                       split_by_study = FALSE,
                       side_by_side = NULL) {
  if (is.null(side_by_side)) {
    extra <- NULL
  } else {
    extra <- c("COUNTRY")
  }
  for (v in c(vars, extra)) {
    assert_that(has_name(adsl, v))
  }
  adsl1 <- adsl %>%
    select(all_of(c("STUDYID", "USUBJID", arm, vars, extra)))
  if (!is.null(side_by_side)) {
    adsl1$lvl <- "Global"
  }
  lyt <- build_table_header(adsl1, arm,
    split_by_study = split_by_study,
    side_by_side = side_by_side
  )
  lyt <- lyt %>%
    analyze_vars(
      na.rm = TRUE,
      .stats = stats,
      denom = "n",
      vars = vars,
      .formats = c(mean_sd = "xx.xx (xx.xx)", median = "xx.xx"),
      var_labels = formatters::var_labels(adsl1)[vars]
    )
  result <- lyt_to_side_by_side(lyt, adsl1, side_by_side)
  if (is.null(side_by_side)) {
    # adding "N" attribute
    arm <- col_paths(result)[[1]][1]
    n_r <- data.frame(
      ARM = toupper(names(result@col_info)),
      N = col_counts(result) %>% as.numeric()
    ) %>%
      `colnames<-`(c(paste(arm), "N")) %>%
      dplyr::arrange(get(arm))
    attr(result, "N") <- n_r
  }
  result@main_title <- "Demographic slide"
  result
}


## -----------------------------------------------------------------------------
filters::load_filters(filters, overwrite = TRUE)
# read data
data <- list(
  "adsl" = eg_adsl %>%
    mutate(
      FASFL = SAFFL, # add FASFL for illustrative purpose for t_pop_slide
      # DISTRTFL is needed for t_ds_slide but is missing in example data
      DISTRTFL = sample(c("Y", "N"), size = length(TRT01A), replace = TRUE, prob = c(.1, .9))
    ) %>%
    preprocess_t_ds(), # this preproccessing is required by one of the autoslider.core functions
  "adae" = eg_adae,
  "adtte" = eg_adtte,
  "adrs" = eg_adrs,
  "adlb" = eg_adlb
)
demography(data$adsl)



## ----include = FALSE----------------------------------------------------------
suggested_dependent_pkgs <- c("filters")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = all(vapply(
    suggested_dependent_pkgs,
    requireNamespace,
    logical(1),
    quietly = TRUE
  ))
)

## ----echo=FALSE---------------------------------------------------------------
knitr::opts_chunk$set(comment = "#")

## ----echo = FALSE, include = FALSE--------------------------------------------
library(autoslider.core)
library(dplyr)

## ----eval = TRUE, include = FALSE---------------------------------------------
# hidden setup
# Install and load the necessary packages
library(yaml)

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
    vars: ["SEX", "AGE", "RACE", "ETHNIC", "COUNTRY"]
- program: lbt06
  titles: Patient Disposition ({filter_titles("adsl")})
  footnotes: "t_ds footnotes"
  paper: L6
  suffix: ITT_LBCRP_LBNOBAS
'

# Create a temporary specs entry file
spec_file <- tempfile(fileext = ".yaml")

# Write the specs entry to the temporary file
write(specs_entry, file = spec_file)



# Clean up the temporary files
# file.remove(filters)
# file.remove(spec_file)

## ----eval = FALSE-------------------------------------------------------------
# # define path to the yml files
# spec_file <- "spec.yml"
# filters <- "filters.yml"

## -----------------------------------------------------------------------------
library("dplyr")
# load all filters
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



# create outputs based on the specs and the functions
outputs <- spec_file %>%
  read_spec() %>%
  # we can also filter for specific programs, if we don't want to create them all
  filter_spec(., program %in% c(
    "t_ds_slide",
    "t_dm_slide"
  )) %>%
  # these filtered specs are now piped into the generate_outputs function.
  # this function also requires the data
  generate_outputs(datasets = data) %>%
  # now we decorate based on the specs, i.e. add footnotes and titles
  decorate_outputs(
    version_label = NULL
  )

## -----------------------------------------------------------------------------
outputs$t_dm_slide_ITT

## ----eval = FALSE-------------------------------------------------------------
# # Output to slides with template and color theme
# outputs %>%
#   generate_slides(
#     outfile = tempfile(fileext = ".ppts"),
#     template = file.path(system.file(package = "autoslider.core"), "/theme/basic.pptx"),
#     table_format = autoslider_format
#   )

## -----------------------------------------------------------------------------
lbt06 <- function(datasets) {
  # Ensure character variables are converted to factors and empty strings and NAs are explicit missing levels.
  adsl <- datasets$adsl %>% tern::df_explicit_na()
  adlb <- datasets$adlb %>% tern::df_explicit_na()

  # Please note that df_explict_na has a na_level argument defaulting to "<Missing>",
  # Please don't change the na_level to anything other than NA, empty string or the default "<Missing>".

  adlb_f <- adlb %>%
    dplyr::filter(ABLFL != "Y") %>%
    dplyr::filter(!(AVISIT %in% c("SCREENING", "BASELINE"))) %>%
    dplyr::mutate(AVISIT = droplevels(AVISIT)) %>%
    formatters::var_relabel(AVISIT = "Visit")

  adlb_f_crp <- adlb_f %>% dplyr::filter(PARAMCD == "CRP")

  # Define the split function
  split_fun <- rtables::drop_split_levels

  lyt <- rtables::basic_table(show_colcounts = TRUE) %>%
    rtables::split_cols_by("ARM") %>%
    rtables::split_rows_by("AVISIT",
      split_fun = split_fun, label_pos = "topleft",
      split_label = formatters::obj_label(adlb_f_crp$AVISIT)
    ) %>%
    tern::count_abnormal_by_baseline(
      "ANRIND",
      abnormal = c(Low = "LOW", High = "HIGH"),
      .indent_mods = 4L
    ) %>%
    tern::append_varlabels(adlb_f_crp, "ANRIND", indent = 1L) %>%
    rtables::append_topleft("    Baseline Status")

  result <- rtables::build_table(
    lyt = lyt,
    df = adlb_f_crp,
    alt_counts_df = adsl
  ) %>%
    rtables::trim_rows()

  result
}

## -----------------------------------------------------------------------------
lbt06(data)

## -----------------------------------------------------------------------------
adlb_f <- eg_adlb %>%
  dplyr::filter(ABLFL != "Y") %>%
  dplyr::filter(!(AVISIT %in% c("SCREENING", "BASELINE"))) %>%
  dplyr::mutate(AVISIT = droplevels(AVISIT)) %>%
  formatters::var_relabel(AVISIT = "Visit")

adlb_f_crp <- adlb_f %>% dplyr::filter(PARAMCD == "CRP")

## -----------------------------------------------------------------------------
lbt06 <- function(datasets) {
  # Ensure character variables are converted to factors and empty strings and NAs are explicit missing levels.
  adsl <- datasets$adsl %>% tern::df_explicit_na()
  adlb <- datasets$adlb %>% tern::df_explicit_na()


  # join adsl to adlb
  adlb <- adlb %>% semi_join(adsl, by = "USUBJID")

  # Please note that df_explict_na has a na_level argument defaulting to "<Missing>",
  # Please don't change the na_level to anything other than NA, empty string or the default "<Missing>".

  adlb_f <- adlb %>%
    dplyr::mutate(AVISIT = droplevels(AVISIT)) %>%
    formatters::var_relabel(AVISIT = "Visit")

  # Define the split function
  split_fun <- rtables::drop_split_levels

  lyt <- rtables::basic_table(show_colcounts = TRUE) %>%
    rtables::split_cols_by("ARM") %>%
    rtables::split_rows_by("AVISIT",
      split_fun = split_fun, label_pos = "topleft",
      split_label = formatters::obj_label(adlb_f_crp$AVISIT)
    ) %>%
    tern::count_abnormal_by_baseline(
      "ANRIND",
      abnormal = c(Low = "LOW", High = "HIGH"),
      .indent_mods = 4L
    ) %>%
    tern::append_varlabels(adlb_f, "ANRIND", indent = 1L) %>%
    rtables::append_topleft("    Baseline Status")

  result <- rtables::build_table(
    lyt = lyt,
    df = adlb_f,
    alt_counts_df = adsl
  ) %>%
    rtables::trim_rows()

  result
}

## -----------------------------------------------------------------------------
# filter data | this step will be performed by the workflow later on

adsl <- eg_adsl
adlb <- eg_adlb

adlb_f <- adlb %>%
  dplyr::filter(ABLFL != "Y") %>%
  dplyr::filter(!(AVISIT %in% c("SCREENING", "BASELINE")))

adlb_f_crp <- adlb_f %>% dplyr::filter(PARAMCD == "CRP")

adsl_f <- adsl %>% filter(ITTFL == "Y")

## -----------------------------------------------------------------------------
lbt06(list(adsl = adsl_f, adlb = adlb_f_crp))

## ----eval = FALSE-------------------------------------------------------------
# source("programs/R/output_functions.R")

## ----eval = FALSE-------------------------------------------------------------
# filters <- "filters.yml"
# spec_file <- "specs.yml"

## -----------------------------------------------------------------------------
filters::load_filters(filters, overwrite = TRUE)

outputs <- spec_file %>%
  read_spec() %>%
  generate_outputs(data) %>%
  decorate_outputs()

outputs$lbt06_ITT_LBCRP_LBNOBAS

## -----------------------------------------------------------------------------
filepath <- tempfile(fileext = ".pptx")
generate_slides(outputs, outfile = filepath)


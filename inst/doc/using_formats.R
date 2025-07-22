## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# autoslider_format <- function(ft,
#                               odd_header = "#0EAED5",
#                               odd_body = "#EBF5FA",
#                               even_body = "#D0E4F2",
#                               ...) {
#   ft %>%
#     flextable::theme_zebra(
#       odd_header = odd_header,
#       odd_body = odd_body,
#       even_header = odd_header, # Use same color for even header
#       even_body = even_body
#     )
#   # ... other general formatting ...
# }

## ----eval = FALSE-------------------------------------------------------------
# blue_format <- function(ft, ...) {
#   # Calls the base function with specific blue colors
#   ft %>% autoslider_format(
#     odd_header = "#0B41CD",
#     odd_body = "#1482FA",
#     even_body = "#BDE3FF",
#     ...
#   )
# }

## ----eval = FALSE-------------------------------------------------------------
# black_format_tb <- function(ft, ...) {
#   ft %>%
#     flextable::theme_booktabs() %>%
#     flextable::color(color = "blue", part = "header")
#   # ... other specific formatting ...
# }

## ----eval= FALSE--------------------------------------------------------------
# outputs <- spec_file %>%
#   read_spec() %>%
#   filter_spec(program %in% c("t_dm_slide")) %>%
#   generate_outputs(datasets = my_data) %>%
#   decorate_outputs()
# 
# # Step 2: Convert a specific output to a flextable object
# dm_table <- to_flextable(outputs$t_dm_slide_ITT)
# # The to_flextable() function returns a list, so we get the first element
# dm_flextable <- dm_table[[1]]$ft
# 
# # Step 3: Apply your formatting functions
# black_ft <- my_own_format(dm_flextable)
# print(black_ft)


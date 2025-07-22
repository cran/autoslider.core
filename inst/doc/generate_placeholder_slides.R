## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
# library(officer)
# library(tools)
# 
# # 1. Define a initial presentation file
# input <- "My_Presentation.pptx"
# read_pptx() %>% print(target = input)
# 
# expected_output_file <- file.path(
#   dirname(input),
#   paste0(file_path_sans_ext(basename(input)), "_final.pptx")
# )
# 
# # 2. Define the presentation structure with a page_list
# my_page_list <- list(
#   list(type = "title", to_page = 1, study_id = "Project No.1"),
#   list(type = "section", to_page = 2, section_title = "Introduction"),
#   list(type = "section", to_page = 3, section_title = "Methodology")
# )
# 
# # 3. Call append_all_slides to generate the deck
# # Set save_file = TRUE to write the result to a new file.
# # If you have an existing pptx object to modify on, pass it into `doc_original`.
# doc_result <- append_all_slides(
#   doc_o = temp_pptx,
#   page_list = my_page_list,
#   doc_original = NULL,
#   save_file = TRUE
# )
# 
# # 4. Verify the output
# cat(paste("Number of slides created:", length(doc_result), "\n"))
# cat(paste("Output file exists:", file.exists(expected_output_file)))


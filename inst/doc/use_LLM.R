## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# spec <- read_spec("path/to/your/spec.yml")
# filters::load_filters("path/to/your/filter.yml")
# prompt_list <- get_prompt_list("path/to/your/prompt.yml")
# 
# # Generate the initial outputs
# outputs <- spec %>%
#   filter_spec(program %in% c("t_dm_slide")) %>%
#   generate_outputs(datasets = my_datasets) %>%
#   decorate_outputs()

## ----eval = FALSE-------------------------------------------------------------
# outputs_ai <- get_ai_notes(
#   outputs = outputs,
#   prompt_list = prompt_list,
#   platform = "ollama",
#   base_url = "http://host.docker.internal:11434", # URL for Ollama if R in a Docker container
#   model = "deepseek-r1:1.5b" # The LLM model name
# )

## ----eval = FALSE-------------------------------------------------------------
# outputs_ai %>%
#   generate_slides(outfile = "My_AI_Presentation.pptx")


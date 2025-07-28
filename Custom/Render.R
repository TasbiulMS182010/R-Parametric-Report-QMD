
library("quarto")
library("gapminder")
library("dplyr")
library("stringr")
library("tibble")
library("purrr")

countries <- 
  gapminder |>
  distinct(country) |>
    pull(country) |>
    as.character()

reports <- 
  tibble(
    input = "Parameterized Report.qmd",
    output_file = str_glue("{countries}.html"),
    execute_params = map(countries, ~list(country = .))
  )

pwalk(reports, quarto_render)

##quarto_render( #This code is just for Running One
##  input = "Parameterized Report.qmd",
##  output_file = "Albania.html",
##  execute_params = list(country="Albania")
##)


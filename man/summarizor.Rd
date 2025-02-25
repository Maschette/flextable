% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarizor.R
\name{summarizor}
\alias{summarizor}
\title{data summary preparation}
\usage{
summarizor(x, by = character(), overall_label = NULL)
}
\arguments{
\item{x}{dataset}

\item{by}{columns names to be used as grouping columns}

\item{overall_label}{label to use as overall label}
}
\description{
It performs a univariate statistical analysis of a dataset
by group and formats the results so that they can be used with
the \code{\link[=tabulator]{tabulator()}} function.
}
\note{
This is very first version of the function; be aware it
can evolve or change.
}
\section{Illustrations}{

ft_1 appears as:

\if{html}{\figure{fig_summarizor_1.png}{options: width="500"}}

ft_2 appears as:

\if{html}{\figure{fig_summarizor_2.png}{options: width="500"}}
}

\examples{
z <- summarizor(CO2[-c(1, 4)],
  by = "Treatment",
  overall_label = "Overall"
)


# version 1 ----
tab_1 <- tabulator(
  x = z,
  rows = c("variable", "stat"),
  columns = "Treatment",
  blah = as_paragraph(
    as_chunk(
      fmt_2stats(
        stat = stat,
        num1 = value1, num2 = value2,
        cts = cts, pcts = percent
      )
    )
  )
)

ft_1 <- as_flextable(tab_1, separate_with = "variable")
ft_1

# version 2 with your own functions ----
n_format <- function(n, percent) {
  z <- character(length = length(n))
  wcts <- !is.na(n)
  z[wcts] <- sprintf("\%.0f (\%.01f \%\%)", n[wcts], percent[wcts] * 100)
  z
}
stat_format <- function(num1, num2, stat) {
  num1_mask <- "\%.01f"
  num2_mask <- "(\%.01f)"

  z_num <- character(length = length(num1))

  is_mean_sd <- !is.na(num1) & !is.na(num2) & stat \%in\% "mean_sd"
  is_range <- !is.na(num1) & !is.na(num2) & stat \%in\% "range"
  is_num_1 <- !is.na(num1) & is.na(num2)

  z_num[is_num_1] <- sprintf(num1_mask, num1[is_num_1])

  z_num[is_mean_sd] <- paste0(
    sprintf(num1_mask, num1[is_mean_sd]),
    " ",
    sprintf(num2_mask, num2[is_mean_sd])
  )
  z_num[is_range] <- paste0(
    sprintf(num1_mask, num1[is_range]),
    " - ",
    sprintf(num1_mask, num2[is_range])
  )
  z_num
}

tab_2 <- tabulator(z,
  rows = c("variable", "stat"),
  columns = "Treatment",
  `Est.` = as_paragraph(as_chunk(stat_format(value1, value2, stat))),
  `N` = as_paragraph(as_chunk(n_format(cts, percent)))
)

ft_2 <- as_flextable(tab_2, separate_with = "variable")
ft_2
}
\seealso{
\code{\link[=fmt_2stats]{fmt_2stats()}}, \code{\link[=labelizor]{labelizor()}}
}

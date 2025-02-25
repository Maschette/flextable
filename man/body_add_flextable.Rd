% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/body_add_flextable.R
\name{body_add_flextable}
\alias{body_add_flextable}
\alias{body_replace_flextable_at_bkm}
\title{add flextable into a Word document}
\usage{
body_add_flextable(
  x,
  value,
  align = "center",
  pos = "after",
  split = FALSE,
  topcaption = TRUE,
  keepnext = NULL
)

body_replace_flextable_at_bkm(
  x,
  bookmark,
  value,
  align = "center",
  split = FALSE
)
}
\arguments{
\item{x}{an rdocx object}

\item{value}{\code{flextable} object}

\item{align}{left, center (default) or right.}

\item{pos}{where to add the flextable relative to the cursor,
one of "after", "before", "on" (end of line).}

\item{split}{set to TRUE if you want to activate Word
option 'Allow row to break across pages'.}

\item{topcaption}{if TRUE caption is added before the table, if FALSE,
caption is added after the table.}

\item{keepnext}{deprecated, keepnext is to to TRUE for captions
on top of tables and FALSE for captions on bottom of tables}

\item{bookmark}{bookmark id}
}
\description{
add a flextable into a Word document.
}
\section{body_replace_flextable_at_bkm}{

Use this function if you want to replace a paragraph containing
a bookmark with a flextable. As a side effect, the bookmark will be lost.
}

\examples{
library(officer)

# autonum for caption
autonum <- run_autonum(seq_id = "tab", bkm = "mtcars")

ftab <- flextable( head( mtcars ) )
ftab <- set_caption(ftab, caption = "mtcars data", autonum = autonum)
ftab <- autofit(ftab)
doc <- read_docx()
doc <- body_add_flextable(doc, value = ftab)
fileout <- tempfile(fileext = ".docx")
# fileout <- "test.docx" # uncomment to write in your working directory
print(doc, target = fileout)
}

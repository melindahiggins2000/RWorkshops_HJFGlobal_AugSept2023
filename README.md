# R Training Workshops for HJF Global Infectious Diseases - Given in Aug and Sept 2023
{:.no_toc}

**R Training Workshops for HJF Global Infectious Diseases - Given in Aug and Sept 2023**

-----

**Workshop Instructor:**

* [Melinda Higgins, PhD](https://melindahiggins.netlify.app/)
    - Director Biostatistics and Data Core
    - Office of Nursing Research
    - School of Nursing - Emory University
    - [melinda.higgins@emory.edu](mailto:melinda.higgins@emory.edu)

-----

**Table of Contents**

* TOC 1
{:toc}

# Preparation

* [Download and install R](https://cran.r-project.org/)
* [Download and install RStudio Desktop](https://posit.co/download/rstudio-desktop/)
* [optional read - Ch1 Getting Started with R/RStudio in "ModernDive" Book](https://moderndive.netlify.app/1-getting-started)
* [Instructions for installing R  packages](https://moderndive.netlify.app/1-getting-started#package-installation) - _we will cover package installation during the workshop_.

## R Packages

* R Packages for Workshops 1 & 2
    - [`arsenal`](https://cran.r-project.org/web/packages/arsenal/index.html)
    - [`broom`](https://cran.r-project.org/web/packages/broom/index.html)
    - [`ggthemes`](https://cran.r-project.org/web/packages/ggthemes/index.html) _(optional)_
    - [`ggthemr`](https://github.com/Mikata-Project/ggthemr) _(optional)_
        - This package is NOT on CRAN and is installed from Github. You will need the [`devtools` package](https://cran.r-project.org/web/packages/devtools/index.html) to run the `devtools::install_github('Mikata-Project/ggthemr')` command.
    - [`gmodels`](https://cran.r-project.org/web/packages/gmodels/index.html)
    - [`gtsummary`](https://cran.r-project.org/web/packages/gtsummary/index.html)
    - [`Hmisc`](https://cran.r-project.org/web/packages/Hmisc/index.html)
    - [`knitr`](https://cran.r-project.org/web/packages/knitr/index.html)
    - [`patchwork`](https://cran.r-project.org/web/packages/patchwork/index.html)
    - [`palmerpenguins`](https://cran.r-project.org/web/packages/palmerpenguins/index.html)
    - [`plyr`](https://cran.r-project.org/web/packages/plyr/index.html)
    - [`psych`](https://cran.r-project.org/web/packages/psych/index.html)
    - [`rmarkdown`](https://cran.r-project.org/web/packages/rmarkdown/index.html)
    - [`tidyverse`](https://cran.r-project.org/web/packages/tidyverse/index.html) [includes `dplyr`, `ggplot2`, `tidyr`, `readr`, and more...]
    - [`tinytex`](https://cran.r-project.org/web/packages/tinytex/index.html) & run the installation - see instructions at [https://yihui.org/tinytex/](https://yihui.org/tinytex/)
    - [`usmap`](https://cran.r-project.org/web/packages/usmap/index.html)

* R Packages for Workshop 3
    - TBA
    
* R Packages for Workshop 4
    - TBA

# Workshop 1 - August 24, 2023: Data Visualization 
## _(plus Intros to R and RStudio and Rmarkdown)_

| Times       | Materials Covered |
|-------------|-------------------|
| 08:30-09:45 | Part 1 - [Intro to R and RStudio](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/HJF_Rworkshop_08242023_pt1.html) |
|             | - [module01_Rscript.R](https://raw.githubusercontent.com/melindahiggins2000/RWorkshops_HJFGlobal_AugSept2023/main/module01_Rscript.R) - right click "save as" |
|             | Part 2 - [Working with R Packages](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/HJF_Rworkshop_08242023_pt2.html) |
|             |  |
| 09:45-10:00 | Break |
|             |  |
| 10:00-11:15 | Part 3 - [Intro to Visualizations with `ggplot2`](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/HJF_Rworkshop_08242023_pt3.html) |
|             | - [ggplot_Rscript_01.R](https://raw.githubusercontent.com/melindahiggins2000/RWorkshops_HJFGlobal_AugSept2023/main/ggplot_Rscript_01.R) |
|             | - [ggplot_Rscript_02.R](https://raw.githubusercontent.com/melindahiggins2000/RWorkshops_HJFGlobal_AugSept2023/main/ggplot_Rscript_02.R) |
|             | Part 4 - Intro to Rmarkdown [if time - see materials below] |
|             |  |
| 11:15-11:30 | Q&A |

* [If Time] Part 4: The Utility of Rmarkdown - Report and Slides all from 1 file!
    - Learn more about the Abalone dataset - freely available from the "UC Irvine Machine Learning Repository", see  [https://archive.ics.uci.edu/ml/datasets/abalone](https://archive.ics.uci.edu/ml/datasets/abalone)
    - Files:
        - [Rmarkdown file with codes](https://raw.githubusercontent.com/melindahiggins2000/RWorkshops_HJFGlobal_AugSept2023/main/AbaloneReport_v1.Rmd)
        - [abalone dataset - CSV format](https://raw.githubusercontent.com/melindahiggins2000/RWorkshops_HJFGlobal_AugSept2023/main/abalone.csv)
        - [Abalone Report - HTML](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/AbaloneReport_v1.html)
        - [Abalone Report - DOCX - DOWNLOAD File](https://raw.githubusercontent.com/melindahiggins2000/RWorkshops_HJFGlobal_AugSept2023/main/AbaloneReport_v1.docx)
        - [Abalone Report - PDF](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/AbaloneReport_v1.pdf)
        - [Abalone Report - HTML Slides, ioslides](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/Abalone_ioslides_v1.html)
        - [Abalone Report - HTML Slides, slidy](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/Abalone_slidy_v1.html)
        - [Abalone Report - PDF Slides, beamer](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/Abalone_beamer_slides_v1.pdf)
        - [Abalone Report - PPT Slides - DOWNLOAD File](https://raw.githubusercontent.com/melindahiggins2000/RWorkshops_HJFGlobal_AugSept2023/main/Abalone_PPTslides_v1.pptx)

# Workshop 2 - August 25, 2023: Data Wrangling and Summary

| Times       | Materials Covered |
|-------------|-------------------|
| 08:30-09:45 | Part 5 - [Data Wrangling with `dplyr`](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/HJF_Rworkshop_08252023_pt1.html) |
|             | - **UPDATED** [dplyr_Rscript.R](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/dplyr_Rscript.R) |
|             | - **UPDATED** [dplyr_Rscript_wAnswers.R](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/dplyr_Rscript_wAnswers.R) |
|             | Part 6 - [Clean and Explore Abalones - R Script](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/module06_Rscript.R) |
|             | - [Part 6 R Script Answers](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/module06_answers_Rscript.R) |
|             | - [abalone_clean.RData](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/abalone_clean.RData) |
|             | - [abalone_table.Rmd](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/abalone_table.Rmd) |
|             | - [abalone_table.html](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/abalone_table.html) |
|             |  |
| 09:45-10:00 | Break |
|             |  |
| 10:00-11:15 | Part 7 - [Merging Data](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/merging_datasets.html) |
|             | - [module07_Rscript.R](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/module07_Rscript.R) |
|             | - [data1.csv](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/data1.csv) |
|             | - [data2.csv](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/data2.csv) |
|             | - [data3.csv](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/data3.csv) |
|             | Part 8 - [Data Restructuring](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/pivot_example.html) |
|             | - [module08_Rscript.R](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/module08_Rscript.R) |
|             | - [long1.csv](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/long1.csv) |
|             | - [wide1.csv](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/wide1.csv) |
|             | Part 9 - If Time [Simple Maps - R script](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/module09_Rscript.R) |
|             | - Dataset [hospital_ops.csv](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/hospital_ops.csv) |
|             | - Map Report Simple [RMD](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/MapReport_simple.Rmd) [HTML](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/MapReport_simple.html) |
|             | - Map Report w/Parameters [RMD](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/MapReport_params.Rmd) [HTML](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/MapReport_params.html) |
|             | - Map Report w/choice [RMD](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/MapReport_params_choice.Rmd) [HTML](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/MapReport_params_choice.html) |
|             |  |
| 11:15-11:30 | Q&A |

### Question on importing datafiles with text blocks

A question was asked about what happens if a data file has text blocks with commas or carriage returns that might cause a problem reading in a delimited file format.

Here is a quick example to illustrate that it does work.

Example Data in CSV and EXCEL formats:

* [textwrap.csv](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/textwrap.csv)
* [textwrap.xlsx](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/textwrap.xlsx)

Example R Code to read these files:

* [textwrap.R](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/textwrap.R)

See this [document](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/textwrap.html) illustrating this **textwrap** example.



# Workshop 3 - September 7, 2023: Regression Methods/Modeling

Additional R packages to be used today:

* [purrr](https://cran.r-project.org/web/packages/purrr/)
* [stargazer](https://cran.r-project.org/web/packages/stargazer/)
* [apaTables](https://cran.r-project.org/web/packages/apaTables/)
* [easystats](https://cran.r-project.org/web/packages/easystats/)
* [parameters](https://cran.r-project.org/web/packages/parameters/)
* [see](https://cran.r-project.org/web/packages/see/)
* [sjPlot](https://cran.r-project.org/web/packages/sjPlot/)
* [sjstats](https://cran.r-project.org/web/packages/sjstats/)
* [pROC](https://cran.r-project.org/web/packages/pROC/)

| Times       | Materials Covered |
|-------------|-------------------|
| 08:30-09:45 | review workshops 1, 2 and textwrap question|
|             | [abalone_cleanData_Rscript.R](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/abalone_cleanData_Rscript.R) |
|             | [abaloneClean_tests_Rscript.R](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/abaloneClean_tests_Rscript.R) |
| 09:45-10:00 | Break |
| 10:00-11:15 | Working with Rmarkdown |
|             | Regression - linear and logistic |
|             | [AbaloneReport_Sept2023.Rmd](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/AbaloneReport_Sept2023.Rmd) |
|             | [AbaloneReport_Sept2023.html](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/AbaloneReport_Sept2023.html) |
|             | [AbaloneReport_Sept2023.pdf](https://melindahiggins2000.github.io/RWorkshops_HJFGlobal_AugSept2023/AbaloneReport_Sept2023.pdf) |
| 11:15-11:30 | Q&A |


# Workshop 4 - September 8, 2023: Missing Data

| Times       | Materials Covered |
|-------------|-------------------|
| 08:30-09:45 | .... |
| 09:45-10:00 | Break |
| 10:00-11:15 | .... |
| 11:15-11:30 | Q&A |

* _...materials to be added..._

-----

# Learn more about Rmarkdown at:

* [Rmarkdown by RStudio](https://rmarkdown.rstudio.com/)
* [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/)
* [R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)
* [Yihui Xie's knitr site](https://yihui.org/knitr/)
* Example Blog [http://jenrichmond.rbind.io/post/2021-08-31-parameterised-penguins/](http://jenrichmond.rbind.io/post/2021-08-31-parameterised-penguins/)
* Example Document [https://rpubs.com/jenrichmond/adelie](https://rpubs.com/jenrichmond/adelie)

-----

# More R Resources - get help and inspiration

* [RStudio Education](https://education.rstudio.com/)
* [Quick-R](https://www.statmethods.net/)
* [BOOK: R in Action, 3rd ed.](https://www.manning.com/books/r-in-action-third-edition)
* [Datacamp](https://www.datacamp.com/)
    * [R for SAS Users - My Datacamp Course](https://www.datacamp.com/courses/r-for-sas-users)
* [Coursera](https://www.coursera.org/)
    * [Reproducible Templates for Analysis and Dissemination - My Coursera Course](https://www.coursera.org/learn/reproducible-templates-analysis)
* My Emory Courses:
    * [Emory N741](https://melindahiggins2000.github.io/N741bigdata/)
    * [Emory N736](https://melindahiggins2000.github.io/N736/)
* [BOOK: Statistical Inference via Data Science](https://moderndive.com/)
* [BOOK: The Epidemiologist R Handbook](https://epirhandbook.com/en/index.html)
* [BOOK: R Graphics Cookbook, 2nd edition](https://r-graphics.org/) by Winston Chang
* [R Graphics Cookbook website]( http://www.cookbook-r.com/Graphs/) also by Winston Chang
* [The R Graph Gallery](https://r-graph-gallery.com/)



# example on reading in text blocks
# from a file that has commas in the comment text block
# and possibly also has carriage returns in a long text block
#
# the example text file has a column called opinion
# for subject ID 4, their comment includes not only some commas
# but also has a carriage (line) return about halfway
#
# both the CSV formatted file, read in with readr::read_csv()
# and the EXCEL formatted file, read in with readxl::read_excel()
# both work. if you look at the dataset and the output for the opinion
# variable, there is a slight difference in how the carriage return
# is noted, but both work fine.
#
# for the CSV file, the carriage return shows up as \n
# for the EXCEL file, the carriage return shows up as \r\n

# read in as a CSV file
library(readr)
textwrap <- read_csv("textwrap.csv")

textwrap


#read in from EXCEL
library(readxl)
textwrap2 <- read_excel("textwrap.xlsx")

textwrap2

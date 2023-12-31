# abalone dataset ==========================
# read in abalone dataset
# file import dataset using readr
library(readr)
abalone <- 
  read_csv("abalone.csv")

# get summary statistics - look at max and min
summary(abalone)

# what do you see?
# should we have any 0's?
# what do you see for height?
# look at top rows sorted by height
library(dplyr)

# HINT: Before running - make Console window wider to see all columns
abalone %>%
  # select(height) %>%
  arrange(desc(height)) %>%
  head()

# HINT: Before running - make Console window wider to see all columns
abalone %>%
  arrange(height) %>%
  head()

# there are 2 abalones that have a height of 0
# let's filter these out
# set filter for height NOT EQUAL TO 0
# use filter(height != 0)
# != is the operator for NOT EQUAL TO
abalone_mod1 <- abalone %>%
  filter(height != 0)  

# How many rows are in abalone?       4177
# How many rows are in abalone_mod1?  4175

# Check the maximum values
# there is also a large height
# the max height was 1.13 and the 3rd quartile is 0.1695
# this might be possible, but let's look at the
# rows sorted by height again
# look at bottom rows with tail()
abalone_mod1 %>%
  arrange(height) %>%
  tail()

# in base R
tail(abalone_mod1[order(abalone_mod1$height), , drop = FALSE])

# there are 2 abalones with large height values
# let's just make a note of these for a moment

# The website, https://archive.ics.uci.edu/ml/datasets/abalone
# tells us that length is the longest of the 2 shell measurements
# Length / continuous / mm / Longest shell measurement
# Diameter / continuous / mm / perpendicular to length
# Height / continuous / mm / with meat in shell
#
# CLEANING YOUR DATA =================================
# Plot diameter by length to spot
# any abalones with diameter > length which is incorrect
# add a y=x reference line
library(ggplot2)
ggplot(abalone_mod1,
       aes(x=diameter, y=length)) +
  geom_point() +
  # add reference line, of slope=1 and intercept=0
  # y = a + bx, a=intercept, b=slope
  geom_abline(slope = 1,
              intercept = 0,
              color = "red")

# EXERCISE 01 YOUR TURN ============================
# make a similar plot to spot any
# abalones with height > length
ggplot(abalone_mod1,
       aes(x=height, y=length)) +
  geom_point() +
  geom_abline(slope = 1,
              intercept = 0,
              color = "red")


# EXERCISE 02 YOUR TURN =============================
# How can we find out how many abalones have
# either diameter or heights that are incorrectly
# recorded as larger than length?
abalone %>%
  filter(diameter > length) %>%
  nrow()
abalone %>%
  filter(height > length) %>%
  nrow()
abalone %>%
  filter((height > length) | (diameter > length)) %>%
  nrow()

#' suppose we want to find
#' the ids of the abalones
#' with this measurement issue

abalone %>%
  filter((height > length) | (diameter > length)) %>%
  select(id)


# EXERCISE 03 YOUR TURN =============================
# Create abalone_mod2 that starts with abalone_mod1
# and filters out any abalones with
# either diameter or height > length
abalone_mod2 <- abalone_mod1 %>%
  filter((height <= length) & (diameter <= length))


# The website also tells us that there are 4
# weight measurements:
# Whole weight / continuous / grams / whole abalone
# Shucked weight / continuous / grams / weight of meat
# Viscera weight / continuous / grams / gut weight (after bleeding)
# Shell weight / continuous / grams / after being dried
# So shucked, viscera and shell weights should all be
# lower that the whole weight.

# EXERCISE 04 YOUR TURN =============================
# Find out if any of the abalones
# have shucked, viscera or shell weights
# that are incorrectly recorded as > whole weight
abalone %>%
  filter((shuckedWeight > wholeWeight) | 
           (visceraWeight > wholeWeight) | 
           (shellWeight > wholeWeight)) %>%
  nrow()

abalone_mod2 %>%
  filter((shuckedWeight > wholeWeight) | 
           (visceraWeight > wholeWeight) | 
           (shellWeight > wholeWeight)) %>%
  nrow()

abalone_mod2 %>%
  filter((shuckedWeight > wholeWeight) | 
           (visceraWeight > wholeWeight) | 
           (shellWeight > wholeWeight)) %>%
  select(id)

# EXERCISE 05 YOUR TURN =============================
# Create abalone_mod3 that filters out any abalones
# where either shucked, viscera or shell weights
# are > whole weight
abalone_mod3 <- abalone_mod2 %>%
  filter((shuckedWeight <= wholeWeight) &  
           (visceraWeight <= wholeWeight) &  
           (shellWeight <= wholeWeight))


# CREATE NEW VARIABLES ==============================
# Let's call the new dataset abalone_clean
abalone_clean <- abalone_mod3

# OPTIONAL - clean up previous versions
rm(abalone_mod1, abalone_mod2, abalone_mod3)

# Let's compute the relative percentage
# that shucked weight is of the whole weight
abalone_clean <- abalone_clean %>%
  mutate(shucked_pct = shuckedWeight * 100 / wholeWeight)
  
# EXERCISE 06 YOUR TURN ==============================
# Also compute the relative percentage
# that viscera weight is of the whole weight
# AND compute the relative percentage
# that shell weight is of the whole weight
abalone_clean <- abalone_clean %>%
  mutate(viscera_pct = visceraWeight * 100 / wholeWeight,
         shell_pct = shellWeight * 100 / wholeWeight)

# CREATE NEW CATEGORICAL variable =========================
# Let's put the M and F into "Adult" category
# separate from I, infants/immature category
abalone_clean <- abalone_clean %>%
  mutate(
    adult = ifelse(
                   test = (sex == "I"), 
                   yes = "immature", 
                   no = "adult"
                   )
    )

# this also works
abalone_clean <- abalone_clean %>%
  mutate(adult = ifelse(sex == "I", "immature", "adult"))

# check recoding
abalone_clean %>%
  with(table(sex, adult))

# another option for cross tablulation
library(gmodels)
abalone_clean %>%
  with(CrossTable(sex, adult))

# save the cleaned dataset
save(abalone_clean, file = "abalone_clean.RData")


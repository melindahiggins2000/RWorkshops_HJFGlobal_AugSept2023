# Introduction to Missing Data in R =============

# simple vector with some NAs ===================
x <- c(1, 2, NA, 3, 4, NA, 1, 2)
is.na(x)

# other possible reserved non-numeric ===========
# and non-character "values" 
y <- c(1, 2, NA, 3, NaN, NA, 1, Inf)
is.na(y)
is.nan(y)
is.infinite(y)
is.numeric(y)

# placeholders for missing data, like 999 =======
z <- c(1, 2, 999, 3, 4, 999, 1, 2)
library(dplyr)
zna <- dplyr::na_if(z, 999)

z
zna

# combine into a data.frame object ===============
df <- data.frame(x, y, z)
df

# https://statisticsglobe.com/r-replace-value-of-data-frame-variable-dplyr-package
# replace the NAs with 0 for column x
# replace the NAs with 0 for column y
# - this also replaces the NaN but not Inf
# also use is.infinite to replace Inf
df0 <- df %>%
  mutate(x1 = replace(x, is.na(x), 0),
         y1 = replace(y, is.na(y), 0),
         y2 = replace(y1, is.infinite(y), 0))
df0

# replace NaN and Inf with NA
dfna <- df %>%
  mutate(yna = replace(y, is.na(y), NA_real_),
         yna2 = replace(yna, is.infinite(yna), NA_real_))
dfna

# impact of NA, NaN and Inf on lm() ===============
# this throws an error because of NaN and Inf
lm1 <- lm(y ~ x, data = df)

# this runs but only for the 6 cases with no NA
lm2 <- lm(z ~ x, data = df)
# number of cases kept
length(lm2$residuals)

# use dfna from above
# this works for the 4 cases with complete data
lm3 <- lm(yna2 ~ x, data = dfna)
# number of cases kept
length(lm3$residuals)

# Useful packages for missing data ==================

# VIM Package is useful for
# visualizing and imputing missing values
library(VIM)

# load sleep dataset from VIM package
data(sleep, package = "VIM")

# quick summary stats of variables
# in sleep dataset, including
# amount of NA's
summary(sleep)

# also look at missing frequencies
# using the table function
# with the useNA = "ifany" option
sleep %>%
  with(table(Dream, useNA = "ifany"))

# look at 2 variables at a time
sleep %>%
  with(table(Dream, 
             Danger,
             useNA = "ifany"))

# aggr() function in VIM package
# look at patterns of missing values
VIM::aggr(sleep)

# another package for missing data
# visualization and imputation
library(mice)
md.pattern(sleep)

# other options using naniar package
library(naniar)
gg_miss_upset(sleep)
gg_miss_var(sleep, show_pct = TRUE)
# Heatplot of missingness across the entire data frame  
vis_miss(sleep)

# using ggplot2
# with geom_miss_point() from naniar package
library(ggplot2)
ggplot(
  data = sleep,
  mapping = aes(x = Dream, y = NonD)) +     
  geom_miss_point()

# look at % of missing across 
# Danger levels
gg_miss_fct(sleep, Danger)

# create indicator of missing
# or non-missing data for a given variable
library(dplyr)
sleep_mod <- sleep %>%
  mutate(NonD_isna = is.na(NonD))

# plot another value based on 
# new group variable for missing or not
ggplot(data = sleep_mod,
       mapping = aes(x = log(BodyWgt), 
                     color = NonD_isna)) + 
  geom_density() +
  labs(color = "NonD Missing?") +
  labs(x = "Natural Log of Body Weight",
       y = "Density",
       title = "Compare Body Weight Distribution",
       subtitle = "By Whether or Not NonD was Missing")

# how to get a dataset with complete data
sleep_complete <- sleep %>%
  filter(complete.cases(.))

# let's add a id (row #) to the dataset
sleep_mod <- sleep_mod %>%
  mutate(id = row_number())

# use rowwise function from dplyr
# and count amount of missing in row
sleep_mod <- sleep_mod %>%
  rowwise() %>%
  mutate(
    nmiss10vars = sum(
      is.na(BodyWgt),
      is.na(BrainWgt),
      is.na(NonD),
      is.na(Dream),
      is.na(Sleep),
      is.na(Span),
      is.na(Gest),
      is.na(Pred),
      is.na(Exp),
      is.na(Danger)))

# quick summary of number of cases with
# 1 or more of the 10 variables missing
# - 3 cases have 3 missing variables
# - 12 cases have 2 missing variables
# - 5 cases have 1 missing variable
# - 42 have complete data - no missing
sleep_mod %>%
  with(table(nmiss10vars,
             useNA = "ifany"))





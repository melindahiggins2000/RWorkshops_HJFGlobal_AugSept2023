# HELP Dataset

load("helplong.RData")
load("helpwide.RData")

library(dplyr)

# get sample details
glimpse(helplong)
dim(helplong)

glimpse(helpwide)
dim(helpwide)

# get variables names
helplong %>%
  names()

helpwide %>%
  names()

# select the first 20 people
# id < 21

# make some smaller datasets
help_ids0120_demo <- helpwide %>%
  select(id,
         treat,
         age,
         female,
         pss_fr,
         racegrp,
         homeless) %>%
  filter(id < 21)

help_ids0120_bl <- helpwide %>%
  select(id,
         pcs,
         mcs,
         cesd) %>%
  filter(id < 21)

# suppose a different set of ids
# get ids 10 to 30
help_ids1030_bl <- helpwide %>%
  select(id,
         pcs,
         mcs,
         cesd) %>%
  filter(id %in% 10:30)

help_ids0120_6m <- helpwide %>%
  select(id,
         pcs1,
         mcs1,
         cesd1) %>%
  filter(id < 21)

# adding more variables - more columns

# base R
# since both datasets have the EXACT
# same ids in the EXACT same order
# we can simply append the new columns
# using cbind
demo_bl <- cbind(help_ids0120_demo,
                 help_ids0120_bl)
# but this adds a column id.1 since 
# both datasets have an "id" variable

# better way, use inner_join (or left join)
# and specify the "id" key variable 
# to complete the join
help_ids0120_demo_bl <-
  inner_join(help_ids0120_demo,
             help_ids0120_bl,
             by = "id")

# But what if the ids are not the same
# and are perhaps in a different sorted order

# inner join - keep cases only if in BOTH datasets
help_bl_inner <-
  inner_join(help_ids0120_demo, help_ids1030_bl,
             by = "id")

# outer join - LEFT join
# keep only cases that match the 1st (LEFT) dataset
help_bl_left <-
  left_join(help_ids0120_demo, help_ids1030_bl,
            by = "id")

# outer join - RIGHT join (reverse of LEFT join)
# keep only cases that match the 2nd (RIGHT) dataset


# full join - keep all cases in EITHER datasets


# adding more rows - like adding another time point
# first add "time" variable to both datasets

# add time point, let baseline = 0
help_ids0120_demo_bl <- help_ids0120_demo_bl %>%
  mutate(time = 0)

# add time = 6 to the 6m dataset
help_ids0120_6m <- help_ids0120_6m %>%
  mutate(time = 6)

# add rows
help_ids0120_demo_bl_6m <-
  bind_rows(help_ids0120_demo_bl,
            help_ids0120_6m)

# why didn't these line up?
# let's fix the variable names
names(help_ids0120_6m)

names(help_ids0120_6m) <- 
  c("id", "pcs", "mcs", "cesd", "time")

names(help_ids0120_6m)

# now try adding the rows again
help_ids0120_demo_bl_6m <-
  bind_rows(help_ids0120_demo_bl,
            help_ids0120_6m)

# you'll notice there are missing 
# elements for the demographics at time 2
# if instead you want to do a one-to-many
# merge BL and 6m first, then add demographics

# 6m names are fixed and has "time"

# add "time" to BL
help_ids0120_bl <- help_ids0120_bl %>%
  mutate(time = 0)

help_bl6m <- 
  bind_rows(help_ids0120_bl,
            help_ids0120_6m)

# now add demographics
# these get "repeated" over all timepoints
help_bl6m_demo <-
  left_join(help_bl6m,
            help_ids0120_demo,
            by = "id")

# getting data summaries ===========================
# make some smaller datasets
help1 <- helpwide %>%
  select(id,
         treat,
         age,
         female,
         pss_fr,
         racegrp,
         homeless,
         pcs,
         mcs,
         cesd) %>%
  filter(id < 21)

help1 <- help1 %>%
  mutate(
    pcs = ifelse(
    (id %in% c(2,5,15)), NA_real_, pcs),
    cesd = ifelse(
      (id %in% c(4,5,18)), NA_real_, cesd)
    )

help1 %>% summary()

# simple stats
mean(help1$mcs)

# get mean for pcs
# simple stats
mean(help1$pcs)

# what happened?
# simple stats
mean(help1$pcs, na.rm = TRUE)

# get the median for the cesd


# other helpful "descriptive" stats functions
library(Hmisc)

describe(help1$pcs)
describe(help1$racegrp)

# another good package - also has describe() function
library(psych)

describe(help1$pcs)
describe(help1$racegrp)

# use package::function() syntax for clarity
psych::describe(help1$pcs)
Hmisc::describe(help1$racegrp)

# getting custom summaries 
# dont forget, add na.rm = TRUE
help1 %>%
  summarise(
    n = n(),
    nmiss_pcs = sum(is.na(pcs)),
    mean_pcs = mean(pcs, na.rm = TRUE),
    sd_pcs = sd(pcs, na.rm = TRUE)
  )

# by groups
# compare homeless yes/no
# custom stats
help1 %>%
  group_by(homeless) %>%
  summarise(
    n = n(),
    nmiss_pcs = sum(is.na(pcs)),
    mean_pcs = mean(pcs, na.rm = TRUE),
    sd_pcs = sd(pcs, na.rm = TRUE)
  )


# This approach uses the map() function from
# the purrr package
# and split() from base R
library(purrr)
help1 %>%
  select(pcs, mcs, cesd, homeless) %>%
  split(.$homeless) %>%
  map(summary)


# more info at
# https://stackoverflow.com/questions/55995426/purrr-split-map-bind-versus-dplyr-group-by-do






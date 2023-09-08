# start with cleaned dataset ========================
load("abalone_clean.RData")

# getting stats by group ============================
# get quick summary statistics by adult grouping
# compares males/females "adults" versus infants
abalone_clean %>%
  group_by(adult) %>%
  summarise(mean_sw = mean(shuckedWeight),
            sd_sw = sd(shuckedWeight),
            n_sw = n())

abalone_clean %>%
  group_by(adult) %>%
  summary()

abalone_clean <- abalone_clean %>%
  mutate(sizecat = case_when(
    (wholeWeight < 0.3) ~ "small",
    (wholeWeight >= 0.3 & wholeWeight < 0.6) ~ "medium",
    (wholeWeight >= 0.6) ~ "large",
    TRUE ~ NA_character_
  ))

# another option for getting grouped output
# tapply() approach for the summary() function
# for descriptive statistics
tapply(X = abalone_clean$shuckedWeight,
       INDEX = abalone_clean$adult,
       FUN = summary)

# also try purrr package - part of tidyverse
library(purrr)

# split from base R is similar to group_by
# the map function from purrr
# specifies the function to "apply"
abalone_clean %>%
  split(.$adult) %>%
  map(summary)

# this works with other functions
# like the describe() function from
# the psych package
abalone_clean %>%
  split(.$adult) %>%
  map(psych::describe)

# T-TEST ============================================
# uses formula syntax
# y ~ x (2 groups)
t.test(shuckedWeight ~ adult, 
       var.equal = TRUE,
       data = abalone_clean)

# check equal variance assumption
bartlett.test(shuckedWeight ~ adult, 
              data = abalone_clean)

# change to unpooled t-test and save output
tt <- t.test(shuckedWeight ~ adult, 
             var.equal = FALSE,
             data = abalone_clean)
tt
tt$p.value
tt$conf.int
lower <- tt$conf.int[1]
upper <- tt$conf.int[2]

# the broom package also creates nice output
library(broom)
broom::tidy(tt)

tidytt <- broom::tidy(tt)

# suppose you want non-parametric statistics
# WILCOXON TEST (MANN-WHITNEY) TEST ================
wt <- wilcox.test(shuckedWeight ~ adult,
                  data = abalone_clean)
wt
wt$p.value

library(broom)
broom::tidy(wt)

# LINEAR MODEL =======================================
# aka, linear regression
# rings = intercept + slope(shuckedWeight)
lm1 <- lm(rings ~ shuckedWeight,
          data = abalone_clean)
lm1
lm1$coefficients
hist(lm1$residuals)

summary(lm1)
anova(lm1)

# save the summarized output
slm1 <- summary(lm1)

slm1$coefficients
slm1$r.squared
slm1$adj.r.squared
slm1$fstatistic

library(broom)
tlm1 <- tidy(lm1)
abalone_clean_lm1 <- augment(lm1)

glance(lm1)
glance(lm1)$p.value
glance(lm1)$r.squared
glance(lm1)$AIC

glm1 <- glance(lm1)
glm1$logLik

# PLOT OF FITTED REGRESSION MODEL ===============
library(ggplot2)
ggplot(abalone_clean,
       aes(x = rings,
           y = shuckedWeight)) +
  geom_point() + 
  geom_smooth(method = lm)

# plot by adults versus infants
ggplot(abalone_clean,
       aes(x = shuckedWeight,
           y = rings,
           color = adult)) +
  geom_point() + 
  geom_smooth(method = lm)

# fit another model with adult added
lm2 <- lm(rings ~ shuckedWeight + adult,
          data = abalone_clean)
lm2
slm2 <- summary(lm2)
slm2

# get the change in R2
r2change <- slm2$r.squared - slm1$r.squared
r2change

# compare the 2 models - test for change in R2
anova(lm1, lm2)


# EXERCISE 07 YOUR TURN =========================
# Choose another variable and see how well
# it is associated with the number of rings
# run the linear model
# and make a plot of the fitted line

# example for shucked_pct
lm2 <- lm(rings ~ shucked_pct,
          data = abalone_clean)
slm2 <- summary(lm2)

tlm2 <- broom::tidy(lm2)
abalone_clean_lm2 <- broom::augment(lm2)
glm2 <- broom::glance(lm2)

ggplot(abalone_clean,
       aes(x=shucked_pct,
           y=rings)) +
  geom_point() + 
  geom_smooth(method = lm) +
  xlab("Percent Shucked Weight of Whole Weight") +
  ylab("Number of Rings") +
  ggtitle("Rings Modeled by Shucked Weight Percent")




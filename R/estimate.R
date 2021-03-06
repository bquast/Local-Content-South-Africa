# estimate.R
# ----------------------
# estimate models
#
# Bastiaan Quast
# bquast@gmail.com


# load libraries
library(plm)
library(pglm)
library(dplyr)
library(ggplot2)


# load data
load(file = "data/merged.RData")


# convert to pdata.frame
pNIDS <- pdata.frame(adulthh, index = c('pid','wave') )
pNIDS$a_owncom <- as.numeric(pNIDS$a_owncom)
pNIDS$h_nfnet  <- as.numeric(pNIDS$h_nfnet)


# estimate models

## define models
m1_0 <- formula(a_owncel ~ event*factor(a_lng))
m1_1 <- formula(a_owncel ~ event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m1_4 <- formula(a_owncel ~ event*setswana + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m1_4_1 <- formula(a_owncel ~ a_woman*event*setswana + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + hhincome)

m3_0 <- formula(h_nfcel  ~ event*factor(a_lng))
m3_1 <- formula(h_nfcel  ~ event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)

m2_0 <- formula(a_owncom ~ event*factor(a_lng))
m2_1 <- formula(a_owncom ~ event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m2_4 <- formula(a_owncom ~ event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
m2_4_1 <- formula(a_owncom ~ a_woman*event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + hhincome)
m2_5 <- formula(a_owncom ~ event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome + best_edu)
m2_5_1 <- formula(a_owncom ~ a_woman*event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + hhincome + best_edu)
m4_0 <- formula(h_nfnet  ~ event*factor(a_lng))
m4_1 <- formula(h_nfnet  ~ event*factor(a_lng) + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m4_2 <- formula(h_nfnet  ~ event*setswana + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman)
m4_2_1 <- formula(h_nfnet  ~ a_woman*event*setswana + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm)
m4_3 <- formula(h_nfnet  ~ event*setswana + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + a_woman + hhincome)
m4_3_1 <- formula(h_nfnet  ~ a_woman*event*setswana + a_edlitrden + a_edlitwrten + a_edlitrdhm + a_edlitwrthm + hhincome)
m4_4 <- formula(h_nfnet  ~ event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome)
m4_5 <- formula(h_nfnet  ~ event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + a_woman + hhincome + best_edu)
m4_5_1 <- formula(h_nfnet  ~ a_woman*event*setswana + factor(a_edlitrden) + factor(a_edlitwrten) + factor(a_edlitrdhm) + factor(a_edlitwrthm) + hhincome + best_edu)


## estimate models
lm1_0 <- lm(m1_0, data = adulthh)
lm1_1 <- lm(m1_1, data = adulthh)
lm1_2 <- lm(m1_2, data = adulthh)
lm1_4 <- lm(m1_4, data = adulthh)
lm1_4_1 <- lm(m1_4_1, data = adulthh)
lm3_0 <- lm(m3_0, data = adulthh)
lm3_1 <- lm(m3_1, data = adulthh)
lm2_0 <- lm(m2_0, data = adulthh)
lm2_1 <- lm(m2_1, data = adulthh)
lm2_2 <- lm(m2_2, data = adulthh)
lm2_3 <- lm(m2_3, data = adulthh)
lm2_4 <- lm(m2_4, data = adulthh)
lm2_4_1 <- lm(m2_4_1, data = adulthh)
lm2_5 <- lm(m2_5, data = adulthh)
lm2_5_1 <- lm(m2_5_1, data = adulthh)
lm4_0 <- lm(m4_0, data = adulthh)
lm4_1 <- lm(m4_1, data = adulthh)
lm4_2 <- lm(m4_2, data = adulthh)
lm4_2_1 <- lm(m4_2_1, data = adulthh)
lm4_3 <- lm(m4_3, data = adulthh)
lm4_3_1 <- lm(m4_3_1, data = adulthh)
lm4_4 <- lm(m4_4, data = adulthh)
lm4_5 <- lm(m4_5, data = adulthh)
lm4_5_1 <- lm(m4_5_1, data = adulthh)


## view results
summary(lm1_0)
summary(lm1_1)
summary(lm1_2)
summary(lm1_4)
summary(lm1_4_1)
summary(lm3_0)
summary(lm3_1)
summary(lm2_0)
summary(lm2_1)
summary(lm2_4)
summary(lm2_4_1)
summary(lm2_5)
summary(lm2_5_1)
summary(lm4_0)
summary(lm4_1)
summary(lm4_2)
summary(lm4_2_1)
summary(lm4_3)
summary(lm4_3_1)
summary(lm4_4)
summary(lm4_5)
summary(lm4_5_1)

m_test <- formula(h_nfnet  ~ event*factor(a_lng))
summary(lm(m_test, adulthh))


# use clustering
# see http://stats.stackexchange.com/questions/10017/standard-error-clustering-in-r-either-manually-or-in-plm

# write about this
# http://stats.stackexchange.com/questions/146434/why-pglm-fails-for-within-model
# http://stats.stackexchange.com/questions/143419/why-are-the-fixed-effects-of-a-panel-probit-regression-inconsistent

# There is a good reason for that. 
# Within model for probit regression suffers from incidental parameters problem. 
# Within model for logit regression can be estimated, but requires quite strong assumptions. 
# This is discussed in J. Wooldridge's "Econometric analysis of cross-section and panel data", chapter 15.
# 
# If you look at the code for pglm, 
# you can see that starting values are calculated with function starting.values. 
# For family binomial the code calculates starting values only for model random and pooling, 
# there is no variant for within. Hence the error. 
# If you supply the starting values, the error is given in the function lnl.binomial. 
# Looking at the code it is clear that model within is not supported.
# 

# NOTE 2_5 DOES NOT NEED CLUSTERING
plm2_5 <- formula(as.numeric(a_owncom) ~ event*setswana + 
                  factor(a_edlitrden) + 
                  factor(a_edlitwrten) + 
                  factor(a_edlitrdhm) + 
                  factor(a_edlitwrthm) + 
                  a_woman + 
                  hhincome)
plm4_3 <- formula(as.numeric(h_nfnet)  ~ event*setswana + 
                    factor(a_edlitrden) + 
                    factor(a_edlitwrten) + 
                    factor(a_edlitrdhm) + 
                    factor(a_edlitwrthm) + 
                    a_woman +
                    hhincome +
                    best_edu)
plm2_5e <- plm(plm2_5, data=pNIDS, model='within')
plm4_3e <- plm(plm4_3, data=pNIDS, model='within')
summary(plm2_5e)
summary(plm4_3e)

# cluster stanard errors
library(lmtest)
library(broom)
tidy( coeftest(plm4_3e, vcov=vcovHC(plm4_3e,type="HC0",cluster="group")) )

# use glm estimation since FE undefined for logit/probit
# binomial
glm2_5e  <- glm(m2_5, data=NIDS, family='binomial')
glm4_1e  <- glm(m4_1, data=NIDS, family='binomial')
pglm2_5e <- pglm(plm2_5, data=pNIDS, model='within', family='binomial') # this will not work
summary(glm2_5e)
summary(glm4_1e)

# Hausman test
fere <- phtest(plm4_1, pNIDS, model=c('within', 'random'))
fepo <- phtest(plm4_1, pNIDS, model=c('within', 'pooling'))


# basic plot of own_computer
NIDS %>%
  filter(a_lng != 'Afrikaans') %>%
  group_by(setswana, wave) %>%
  summarise(own_computer = mean(own_computer, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=own_computer, colour=setswana)) %+%
  geom_line() %+% 
  scale_colour_brewer(palette='Set1')

# full plot of own_computer
NIDS %>%
  group_by(language, wave) %>%
  summarise(own_computer = mean(own_computer, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=own_computer, fill=language)) %+%
  geom_bar(stat='identity') %+%
  facet_grid(~language)

# basic plot of a_owncel
NIDS %>%
  group_by(setswana, wave) %>%
  summarise(own_cel = mean(a_owncel, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=own_cel, colour=setswana)) %+%
  geom_line() %+% 
  scale_colour_brewer(palette='Set1')

# full plot of a_owncel
NIDS %>%
  group_by(a_lng, wave) %>%
  summarise(a_owncel = mean(a_owncel, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=a_owncel, fill=a_lng)) %+%
  geom_bar(stat='identity') %+%
  facet_grid(~a_lng)

# basic plot of internet_expenditure
NIDS %>%
  filter(a_lng != 'Tshivenda') %>%
  filter(a_lng != 'IsiTsonga') %>%
  group_by(setswana, wave) %>%
  summarise(internet_expenditure = mean(internet_expenditure, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=internet_expenditure, colour=setswana)) %+%
  geom_line() %+%
  scale_colour_brewer(palette='Set1')

# full plot of h_nfnet
NIDS %>%
  filter(a_lng != 'Tshivenda') %>%
  filter(a_lng != 'IsiTsonga') %>%
  group_by(a_lng, wave) %>%
  summarise(h_nfnet = mean(h_nfnet, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=h_nfnet, fill=a_lng)) %+%
  geom_bar(stat='identity') %+%
  facet_grid(~a_lng)

# save results
save(lm2_5,
     lm4_0,
     lm4_1,
     lm4_2,
     lm4_3,
     lm4_4,
     lm4_5,
     file = 'data/results.RData')

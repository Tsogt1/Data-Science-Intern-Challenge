#Loading the library 'rio'
#install.packages('rio')
library(rio)
#install.packages('mice')
library(mice)
#install.packages('missMDA') 
library(missMDA)
#install.packages('tidyverse') 
library(tidyverse) #ggplot2 dplyr

link = "https://docs.google.com/spreadsheets/d/16i38oonuX1y1g7C_UAmiK9GkY7cS-64DfiDMNiR41LM/edit#gid=0"
df <- import(link)

#Print the first two observations
head(df,2)
#summary of the data
summary(df)

#Examine missing values
md.pattern(df,
           rotate.names = T)

#Let's check for outliers in the
#order_amount
boxplot(df$order_amount,horizontal = T)  -> bp

#Take a closer look at the outliers
num_prop_out <- bp$out

summary(num_prop_out)
#What is the ratio outliers/ observations
length(num_prop_out) / length(df$order_amount)
#2.8% of the number of properites


#how many outliers
length(num_prop_out)

#Lets eliminate outliers and find AOV
df %>% 
  filter(order_amount < 735) %>% 
  summarise(AOV = mean(order_amount)) %>% 
  mutate(AOV = sprintf("%0.2f", AOV))
 
#293.72


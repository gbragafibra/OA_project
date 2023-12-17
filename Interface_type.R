library(readxl)
library(ggplot2)
library(tidyverse)
library(caret)
library(multcompView)
library(dplyr)
data = read_excel("1FCC_A_Interface_ratios.xlsx")
data_b = read_excel("1FCC_B_Interface_ratios.xlsx")
dim(data)
str(data)

data2 = data %>% mutate(RES_NAME = as.factor(RES_NAME),
                        I_LOC = as.factor(I_LOC),
                        Interface = I_LOC)
head(data2)
data2_b = data_b %>% mutate(RES_NAME = as.factor(RES_NAME),
                          I_LOC = as.factor(I_LOC),
                          Interface = I_LOC)


int_type_A = data2 %>% group_by(RES_NAME) %>% ggplot(aes(x = RES_NAME, fill = Interface)) +
  geom_bar() + theme_classic() + labs(title = "Chain A Interface", 
                                      x = "Residue", y = "Count") + scale_fill_brewer(palette="RdGy")
int_type_A

ggsave("INT_A.png", plot = int_type_A, width = 8, height = 6, dpi = 300)

int_type_B = data2_b %>% group_by(RES_NAME) %>% ggplot(aes(x = RES_NAME, fill = Interface)) +
  geom_bar() + theme_classic() + labs(title = "Chain B Interface", 
                                      x = "Residue", y = "Count") + scale_fill_brewer(palette="RdGy")
int_type_B
ggsave("INT_B.png", plot = int_type_B, width = 8, height = 6, dpi = 300)


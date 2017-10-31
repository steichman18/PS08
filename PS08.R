library(tidyverse)
library(caret)
<<<<<<< HEAD
library(plyr)
=======
>>>>>>> a8c49444bc48c16c8f16b244f0428ad9e1e9a1bf

# Package for easy timing in R
library(tictoc)

<<<<<<< HEAD
#PS INFO:
#1) tictoc = stopwatch, tic before, toc after, clocks something 
#2) data has about n = 30x10^6
#3) model: don't care about predictions or EDA, just want runtime of knn as function of
#         (1) n = size train set, (2) k = # neighbors, (3) p = # predictors (held constant at 3)
#4) goal: for different combos of n and k, evaluate run time of knn (only fitting, no prediction)
#         summarize in a plot (want a big-O statement of runtime)
#5) questions: (1) for what range of k vals? (2) for what range of n vals? (3) how to plot?
#              (4) guess at big-O runtime 
#6) tips: (1) save code early and often (2) done better than perfect
=======
>>>>>>> a8c49444bc48c16c8f16b244f0428ad9e1e9a1bf


# Demo of timer function --------------------------------------------------
# Run the next 5 lines at once
tic()
Sys.sleep(3)
timer_info <- toc()
runtime <- timer_info$toc - timer_info$tic
runtime



# Get data ----------------------------------------------------------------
# Accelerometer Biometric Competition Kaggle competition data
# https://www.kaggle.com/c/accelerometer-biometric-competition/data
<<<<<<< HEAD
train <- read_csv("train.csv")
=======
train <- read_csv("~/Downloads/train.csv")

# YOOGE!
dim(train)


>>>>>>> a8c49444bc48c16c8f16b244f0428ad9e1e9a1bf

# knn modeling ------------------------------------------------------------
model_formula <- as.formula(Device ~ X + Y + Z)

<<<<<<< HEAD
n_tot = nrow(train)
# Values to use:
n_values <- c(10^6,2*10^6,3*10^6,4*10^6,5*10^6,6*10^6,7*10^6,8*10^6,9*10^6,10^7)
n_values <- round(n_values)
smallest_n <- n_values[1]
k_values <- c(10,.25*smallest_n,.5*smallest_n,.75*smallest_n,smallest_n)
k_values <- round(k_values)

runtime_dataframe <- expand.grid(k_values, n_values) %>%
  as_tibble() %>%
  rename(k=Var1, n=Var2) %>%
  mutate(runtime = n*k,type=k)
=======
# Values to use:
n_values <- c(10, 20, 30)
k_values <- c(2, 3, 4)

runtime_dataframe <- expand.grid(n_values, k_values) %>%
  as_tibble() %>%
  rename(n=Var1, k=Var2) %>%
  mutate(runtime = n*k)
>>>>>>> a8c49444bc48c16c8f16b244f0428ad9e1e9a1bf
runtime_dataframe




# Time knn here -----------------------------------------------------------
<<<<<<< HEAD
timing <- function(K,data_n) {
  tic()
  mod <- caret::knn3(model_formula, data=data_n, k = K)
  timer_info <- toc()
  return(timer_info$toc - timer_info$tic) 
}
count = 1
for (n in n_values) {
  k_values = c(10,n*.25,n*.5,n*.75,n)
  for (k in k_values) {
    data_n = slice(train,1:n)
    x = timing(k,data_n)
    runtime_dataframe[count,3] = x
    runtime_dataframe[count,1] = k
    count = count+1
  }
}

data_n = slice(train, 1:(10^7))
tic()
mod <- caret::knn3(model_formula, data=data_n, k = 10000)
timer_info <- toc()

runtime_dataframe$type <- rep(c("10",".25*n",".50*n",".75*n","n"),10)
=======



>>>>>>> a8c49444bc48c16c8f16b244f0428ad9e1e9a1bf

# Plot your results ---------------------------------------------------------
# Think of creative ways to improve this barebones plot. Note: you don't have to
# necessarily use geom_point
<<<<<<< HEAD
runtime_plot <- ggplot(runtime_dataframe, aes(x=n, y=runtime, col=as.factor(type))) +
  geom_line() +
  labs(title="Runtime by size of sample (N) and number of nearest neighbors (K)",x="N",y="Runtime (seconds)",col="K")

runtime_plot

ggsave(filename="Sarah_Teichman.png", width=16, height = 9)
=======
runtime_plot <- ggplot(runtime_dataframe, aes(x=n, y=k, col=runtime)) +
  geom_point()

runtime_plot
ggsave(filename="firstname_lastname.png", width=16, height = 9)



>>>>>>> a8c49444bc48c16c8f16b244f0428ad9e1e9a1bf

# Runtime complexity ------------------------------------------------------
# Can you write out the rough Big-O runtime algorithmic complexity as a function
# of:
# -n: number of points in training set
# -k: number of neighbors to consider
# -d: number of predictors used? In this case d is fixed at 3

<<<<<<< HEAD
#O(nd), because in this plot the runtime appears to be linear with n, and k does not have a
#noticeable effect on the runtime. I think that it would scale with d, because as the number 
#predictors increases, it would take more time to compute the distances between each of the 
#points (I would image there would be a for loop over each dimension and it would have to 
#compute the summed squared differences within it, for 1:d).
=======

>>>>>>> a8c49444bc48c16c8f16b244f0428ad9e1e9a1bf

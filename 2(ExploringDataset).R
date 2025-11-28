# Load required package
library(dplyr)

# 1. Import inbuilt dataset: iris
data("iris")
head(iris)          # first 6 rows
str(iris)           # gives structure
summary(iris)       # gives summary statistics

# 2. Import another dataset: mtcars
data("mtcars")
head(mtcars)
str(mtcars)

# 3. Titanic dataset (one more dataset)
data("Titanic")
Titanic             # view dataset

# 4. Check for missing values
sum(is.na(iris))        # gives the count of total missing values
colSums(is.na(mtcars))  # missing values per column

# 5. Summarize distribution by group, groups them using column in iris, then summarizes sepal length and petal length column by taking the mean of them 
iris %>%
  group_by(Species) %>%
  summarise(
    Avg_Sepal_Length = mean(Sepal.Length),
    Avg_Petal_Length = mean(Petal.Length)
  )


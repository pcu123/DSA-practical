library(dplyr) #datamanipulation

# Load iris dataset
data("iris")

# 1. t-test: Compare Sepal.Length of setosa and versicolor
t_test_result <- t.test(
  Sepal.Length ~ Species,
  data = iris %>% filter(Species %in% c("setosa", "versicolor"))
)
t_test_result #selects only the setosa and versicolor and compare their sepal.length means
              #and test if there's a significant difference

# 2. ANOVA: Compare Sepal.Length across all species
anova_model <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_model) #comparing sepal.length means of setosa, versicolor, virginica
                     #testing if there's atleast one specices with significant difference

# 3. Correlation: Sepal.Length and Petal.Length
correlation <- cor(iris$Sepal.Length, iris$Petal.Length)
correlation #compute pearson's coeffcient between sepal.length and petal.length, -1 to +1
            #there's a strong positive correlation, both inc. together

# 4. Correlation test with significance
cor_test <- cor.test(iris$Sepal.Length, iris$Petal.Length)
cor_test #tests if the correlation is significantly different from zero
         #very small p-value → the correlation is significant
library(dplyr)
library(ggplot2)
library(GGally) #ggpairs pairwise plots
library(ggcorrplot) #correlation matrix

# Load dataset
data("iris")
head(iris)

# 1. Summary statistics
summary(iris)

# 2. Histogram of Sepal.Length
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram(bins = 20, fill = "lightblue", color = "black") + #bins = 20 splits the range into 20 bars
  labs(title = "Distribution of Sepal Length", x = "Sepal Length", y = "Frequency")

# 3. Scatterplot Sepal.Length vs Petal.Length
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 3) +
  labs(title = "Sepal Length vs Petal Length")
#a strong positive relationship; setosa points cluster separately from versicolor/virginica

# 4. Boxplot of Sepal.Width by Species
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Sepal Width by Species")
#each species, shows median, IQR, whiskers and outliers.

# 5. Correlation matrix (numeric columns only)
corr_matrix <- cor(iris[, 1:4]) #cor(iris[,1:4]) computes Pearson correlations among the 4 numeric features
corr_matrix
ggcorrplot(corr_matrix, lab = TRUE, title = "Correlation Matrix Heatmap") #ggcorrplot draws a heatmap with correlation numbers

# 6. Pair plot
ggpairs(iris[, 1:4], mapping = aes(color = iris$Species))
#produces a matrix of plots:scatterplots (lower triangle), histogram (diagonal), correlation (upper triangle),
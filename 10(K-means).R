library(dplyr) #data manipulation
library (ggplot2) #plotting
library(factoextra) #visualizing clusters
# Load dataset 
data("iris")
iris_data <- iris[, 1:4] #select only the numeric columns [rows, cols]
#K-means clustering requires only numeric columns.

# 1. Elbow Method to find optimal K
fviz_nbclust(iris_data, kmeans, method = "wss") + #elbow method used to visualize WSS(within-cluster sum of sq)
  labs(title = "elbow method")

# 2. Apply K-means clustering with K=3
set.seed (1) #for reproducible or same clusters everytime
kmeans_model <- kmeans(iris_data, centers = 3, nstart = 20) #3 clusters and 20 random starting points

# 3. Cluster assignments
kmeans_model$cluster [1:10] #extracts 10 rows and finds the cluster no. of it (ex.3)
table (kmeans_model$cluster, iris$Species) #creates a table for species types based on numeric values

# 4. Visualize clusters
fviz_cluster (kmeans_model, data = iris_data, #cluster plot using factoextra
              ellipse.type = "norm",
              palette = "jco",
              ggtheme = theme_minimal())

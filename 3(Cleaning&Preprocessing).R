#load package
library(dplyr)

# Load dataset
data("airquality")
head(airquality)

# 1. Check for missing values
sum(is.na(airquality))           # gives total NA count
colSums(is.na(airquality))       # displays missing values per column

# 2. Handle missing values
# Replace missing values in Ozone values mean of the entire column 
airquality$Ozone[is.na(airquality$Ozone)] <- mean(airquality$Ozone, na.rm = TRUE)

# Replace missing values in Solar.R values with median of the entire column 
airquality$Solar.R[is.na(airquality$Solar.R)] <- median(airquality$Solar.R, na.rm = TRUE)

# 3. Remove duplicates (example with iris dataset)
data("iris")
iris_with_duplicates <- rbind(iris, iris[1:5, ])   # add duplicates artificially
nrow(iris_with_duplicates)                         # before removing
iris_clean <- distinct(iris_with_duplicates)       # remove duplicates
nrow(iris_clean)                                    # after removing

# 4. Standardize formats
iris_clean$Species <- tolower(as.character(iris_clean$Species)) #converts text to lower case
iris_clean$Species <- as.factor(iris_clean$Species) #converts categorical values to factors 

# View cleaned dataset
head(iris_clean)

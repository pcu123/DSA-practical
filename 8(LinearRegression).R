library(dplyr) #data manipulation
library(ggplot2) #plots

# Load dataset
data("mtcars") 
head(mtcars)

# 1. Simple Linear Regression: mpg predicted by wt
model_simple <- lm(mpg ~ wt, data = mtcars) #mpg ~ wt means “mpg depends on weight”
                                            #lm() fits a straight-line relationship, wt increases-> mpg decreases
summary(model_simple)

# 2. Plot regression line
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "blue") + #scatter plot
  geom_smooth(method = "lm", se = TRUE, color = "red") + #linear regression line
  labs(title = "linear regression: mpg vs wt",
       x = "weight", y = "miles per gallon")

# 3. Multiple Linear Regression: mpg predicted by wt and hp
model_multiple <- lm(mpg ~ wt + hp, data = mtcars) #predict mpg using wt $ hp
                                                   #heavier car, more hp-> lower mpg
summary(model_multiple)

# 4. Residual diagnostics
plot(model_multiple, which = 1)   # Residuals(actual-predicted mpg) vs Fitted(what models predict), each point is a car 
#which=1 means plot 1             #scatter residuals->good, curve/pattern->not fit for data

plot(model_multiple, which = 2)   # Normal Q-Q(quantile-quantile) Plot, each point is a residual
#which=2 means plot 2             #points close to the line->good, curve/bend->residuals are not normal

#plot 1: not a linear reln, plot 2: residuals arent normal
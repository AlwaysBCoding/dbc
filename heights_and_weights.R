# CONFIGURATION
setwd("~/Desktop/dbc/")
library("ggplot2")

# READ THE HEIGHTS AND WEIGHTS DATA SET FROM FILE
heights.weights <- read.csv("heights_weights_genders.csv")
heights.weights

# PLOT THE HEIGHTS AND WEIGHTS
ggplot(heights.weights, aes(x=Height, y=Weight))+
      geom_point()

# ANALYZE THE HEIGHTS AND WEIGHTS
lm(heights.weights$Weight ~ heights.weights$Height)

ggplot(heights.weights, aes(x=Height, y=Weight))+
      geom_point()+
      geom_smooth(method="lm")

print((70 * 7.717) - 350.737)

# PLOT THE HEIGHTS
ggplot(heights.weights, aes(x=Height))+
      geom_density()

summary(heights.weights$Height)
sd(heights.weights$Height)

normal.sample <- as.data.frame(rnorm(n=100000, m=66.37, sd=3.847528))
colnames(normal.sample) <- c("number")

ggplot(normal.sample, aes(x=number))+
      geom_density()

# PLOT THE WEIGHTS
ggplot(heights.weights, aes(x=Weight))+
      geom_density()

ggplot(heights.weights, aes(x=Weight, fill=Gender))+
      geom_density()

ggplot(heights.weights, aes(x=Weight, fill=Gender))+
      geom_density()+
      facet_grid(Gender ~ .)

# PLOT THE HEIGHTS AND WEIGHTS WITH GENDER COLOR
ggplot(heights.weights, aes(x=Height, y=Weight, color=Gender))+
      geom_point()

# RECALCULATE OUR PREDICTION FOR A 5'10 *MALE*
only_males <- subset(heights.weights, Gender=="Male")
lm(only_males$Weight ~ only_males$Height)
print((70 * 5.962) - 224.499)

## TURN INTO CLASSIFICATION. GIVEN A HEIGHT AND A WEIGHT CAN WE CLASSIFY SOMEONE AS MALE OR FEMALE?
heights.weights <- transform(heights.weights, Male=ifelse(Gender == "Male", 1, 0))
logit.model <- glm(Male ~ Height + Weight, data=heights.weights, family=binomial(link="logit"))
logit.intercept <- - coef(logit.model)[1] / coef(logit.model)[3]
logit.slope <- - coef(logit.model)[2] / coef(logit.model)[3]

ggplot(heights.weights, aes(x=Height, y=Weight, color=Gender))+
      geom_point()+
      geom_abline(slope=logit.slope, intercept=logit.intercept, color="black")

ggplot(heights.weights, aes(x=Height, y=Weight, color=Gender))+
      geom_point()+
      geom_abline(slope=logit.slope, intercept=logit.intercept, color="black")+
      geom_point(x=70, y=195, color="yellow")

# LETS USE A NEW DATA SET THAT HAS WOMAN ATHELETE SPORTS ADDED AS WELL
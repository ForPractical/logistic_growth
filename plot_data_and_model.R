#Script to plot data and model

growth_data <- read.csv("experiment.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

exponential_fun <- function(t){
  N<-N0*exp(r*t)
  return(N)
}

N0 <- 879

r <- 0.01

K <- 60000000000

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  geom_function(fun=exponential_fun,color="blue")+
  scale_y_continuous(trans='log10')+
  geom_point(size=0.6)+
  labs(title="Exponential and logistic growth of population",
       y="log(N), N=population size",
       x="time t (min)")


#scale_y_continuous(trans='log10')
#note the position between t and N

sink(file = "package-versions.txt")
sessionInfo()
sink()
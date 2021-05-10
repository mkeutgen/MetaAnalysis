####################################
## R script to implement bivariate 
## correlations coefficients
## Author : Maxime Keutgen 
## Based on a paper of Douglas G. Bonett
## Paper title : Meta-Analytic Interval Estimation for Bivariate Correlations
####################################
meta.ci.corr <- function(rho.hat,n)
{
  m <- length(rho.hat)
  rho.bar <- sum(rho.hat)/m
  var.tanh <- (m^(-2)*sum((1-rho.hat^2)^2/(n-3)) )/(1-rho.bar^2)^2
  lower.ci <- tanh( atanh(rho.bar) - 1.96*sqrt(var.tanh) )
  upper.ci <- tanh( atanh(rho.bar) + 1.96*sqrt(var.tanh) )
  result <- list("number of studies"=m,"mean effect"=rho.bar," mean effect variance"=var.tanh,"95 % conf int"=paste(round(lower.ci,digits = 3),round(upper.ci,digits=3),sep=";"))
  return(result)
}

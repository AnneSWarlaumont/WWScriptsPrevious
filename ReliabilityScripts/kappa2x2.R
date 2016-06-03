#Finds kappa for 2x2 matrix

kappa <- function (a, b, c, d) {
  n <- a+b+c+d
  p.agreement <- (a+d)/n
  totAC <- a+c
  totBD <- b+d
  p.expected <- (totAC/n)+(totBD)/n
  kappa <- (p.agreement-p.expected)/(1-p.expected)
  return(kappa)
}
  
#finds kappa max for 3x3 matrix.
kmax <- function(a, b, c, d, e, f, g, h, i, maxpobs) {
  n <- a+b+c+d+e+f+g+h+i
  pobs <- a+e+i
  totABC <- a+b+c
  totDEF <- d+e+f
  totGHI <- g+h+i
  totADG <- a+d+g
  totBEH <- b+e+h
  totCFI <- c+f+i
  chance1 <- (totADG*totABC)/n^2
  chance2 <- (totBEH*totDEF)/n^2
  chance3 <- (totCFI*totGHI)/n^2
  #maxpobs <- max.pobs
  pexp <- chance1+chance2+chance3
  kmax <- (maxpobs-pexp)/(1-pexp)
  return(kmax)
}

#kmax(2, 3, 1, 0, 15, 0, 0, 1, 3)
#0.8820755

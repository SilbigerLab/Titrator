function (S = 35, T = 25, C = 0.1, d = 1, pHTris = NULL, ETris = NULL, 
          weight, E, volume) 
{
  R <- 8.31447215
  F <- 96485.339924
  test <- length(T) != length(E)
  if (test) {
    T <- rep(T[1], length(E))
  }
  Tk <- T + 273.15
  p <- data.frame(E = E, volume = volume, Tk = Tk)
  z <- p
  if (!is.null(pHTris) & !is.null(ETris)) {
    pH <- pHTris + (ETris/1000 - E/1000)/(R * Tk * log(10)/F)
    p <- data.frame(p, pH = pH)
    iii <- which((3 <= p$pH) & (p$pH <= 3.5))
    z <- p[iii, ]
  }
  options(digits = 9)
  m <- z$volume * d
  m0 <- weight
  F1 <- (m0 + m) * exp((z$E/1000)/(R * (z$Tk)/F))
  f <- lm(m ~ F1)
  TA <- f$coefficients[1] * C/m0[1]
  E0 <- z$E/1000 - (R * z$Tk/F) * log((-m0 * TA + m * C)/(m0 + 
                                                            m))
  Hprime <- exp((z$E/1000 - E0)/(R * z$Tk/F))
  Cl <- S/1.80655
  St <- 0.14 * Cl/96.062
  Ks <- Ks(S, T[1], 0)
  Z <- 1 + St/Ks
  Ft <- 6.7e-05 * Cl/18.9984
  Kf <- exp(874/z$Tk - 9.68 + 0.111 * S^(1/2))
  y <- (m/m0)
  regr <- nls(y ~ ((At + (St/(1 + Ks * Z/(f * Hprime))) + (Ft/(1 + 
                                                                 Kf/(f * Hprime))) + (f * Hprime/Z))/(C - f * Hprime/Z)), 
              start = list(At = TA, f = 1))
  ALK <- summary(regr)$parameters[1]
  attr(ALK, "unit") <- "mol/kg-soln"
  attr(ALK, "name") <- "Total Alkalinity"
  return(ALK)
  
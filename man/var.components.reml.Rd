\name{var.components.reml}
\alias{var.components.reml}
\title{Variance components estimation using REML or maximum likelihood}
\usage{
  var.components.reml(theta, design, vcv = NULL,
    rdesign = NULL, initial = NULL, interval = c(-25, 10),
    REML = TRUE)
}
\arguments{
  \item{theta}{vector of parameter estimates}

  \item{design}{design matrix for fixed effects combining
  parameter estimates}

  \item{vcv}{estimated variance-covariance matrix for
  parameters}

  \item{rdesign}{design matrix for random effect (do not
  use intercept form; eg use ~-1+year instead of ~year); if
  NULL fits only iid error}

  \item{initial}{initial values for variance components}

  \item{interval}{interval bounds for log(sigma) to help
  optimization from going awry}

  \item{REML}{if TRUE uses reml else maximum likelihood}
}
\value{
  A list with the following elements \item{neglnl}{negative
  log-likelihood for fitted model} \item{AICc}{small sample
  corrected AIC for model selection} \item{sigma}{variance
  component estimates; if rdesign=NULL, only an iid error;
  otherwise, iid error and random effect error}
  \item{beta}{dataframe with estimates and standard errors
  of betas for design} \item{vcv.beta}{variance-covariance
  matrix for beta}
}
\description{
  Computes estimated effects, standard errors and variance
  components for a set of estimates
}
\details{
  The function \code{\link{var.components}} uses method of
  moments to estimate a single process variance but cannot
  fit a more complex example.  It can only estimate an iid
  process variance.  However, if you have a more
  complicated structure in which you have random year
  effects and want to estimate a fixed age effect then
  \code{\link{var.components}} will not work because it
  will assume an iid error rather than allowing a common
  error for each year as well as an iid error.  This
  function uses restricted maximum likelihood (reml) or
  maximum likelihood to fit a fixed effects model with an
  optional random effects structure.  The example below
  provides an illustration as to how this can be useful.
}
\examples{
\donttest{
# Use dipper data with an age (0,1+)/time model for Phi
data(dipper)
dipper.proc=process.data(dipper,model="CJS")
dipper.ddl=make.design.data(dipper.proc,
   parameters=list(Phi=list(age.bins=c(0,.5,6))))
levels(dipper.ddl$Phi$age)=c("age0","age1+")
md=mark(dipper,model.parameters=list(Phi=list(formula=~time+age)))
# extract the estimates of Phi
zz=get.real(md,"Phi",vcv=TRUE)
# assign age to use same intervals as these are not copied
# across into the dataframe from get.real
zz$estimates$age=cut(zz$estimates$Age,c(0,.5,6),include=TRUE)
levels(zz$estimates$age)=c("age0","age1+")
z=zz$estimates
# Fit age fixed effects with random year component and an iid error
var.components.reml(z$estimate,design=model.matrix(~-1+age,z),
        zz$vcv,rdesign=model.matrix(~-1+time,z))
# Fitted model assuming no covariance structure to compare to
# results with lme
xx=var.components.reml(z$estimate,design=model.matrix(~-1+age,z),
 matrix(0,nrow=nrow(zz$vcv),ncol=ncol(zz$vcv)),
 rdesign=model.matrix(~-1+time,z))
xx
sqrt(xx$sigmasq)
library(nlme)
lme(estimate~-1+age,data=z,random=~1|time)
}
}
\author{
  Jeff Laake
}


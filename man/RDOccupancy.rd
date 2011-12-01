\docType{data}
\name{RDOccupancy}
\alias{RDOccupancy}
\title{Robust Design occupancy example data}
\format{A data frame with 35 observations on the following 12 variables
\describe{ \item{ch}{A character vector containing the presence (1) and
absence (0) or (.) not visited for each of 3 visits (secondary occasions)
over 3 years (primary occasions)} \item{cover}{percentage canopy cover at
each sampled habitat} \item{occ11}{one of 9 session-dependent variables
occ11 to occ33 containing the week the survey was conducted; p is the
primary session number and s is the secondary session number}
\item{occ12}{one of 9 session-dependent variables occ11 to occ33 containing
the week the survey was conducted; p is the primary session number and s is
the secondary session number} \item{occ13}{one of 9 session-dependent
variables occ11 to occ33 containing the week the survey was conducted; p is
the primary session number and s is the secondary session number}
\item{occ21}{one of 9 session-dependent variables occ11 to occ33 containing
the week the survey was conducted; p is the primary session number and s is
the secondary session number} \item{occ22}{one of 9 session-dependent
variables occ11 to occ33 containing the week the survey was conducted; p is
the primary session number and s is the secondary session number}
\item{occ23}{one of 9 session-dependent variables occ11 to occ33 containing
the week the survey was conducted; p is the primary session number and s is
the secondary session number} \item{occ31}{one of 9 session-dependent
variables occ11 to occ33 containing the week the survey was conducted; p is
the primary session number and s is the secondary session number}
\item{occ32}{one of 9 session-dependent variables occ11 to occ33 containing
the week the survey was conducted; p is the primary session number and s is
the secondary session number} \item{occ33}{one of 9 session-dependent
variables occ11 to occ33 containing the week the survey was conducted; p is
the primary session number and s is the secondary session number}
\item{samplearea}{continuous variable indicating area size (ha) of the
sampled habitat} }}
\description{
  A simulated data set on a breeding bird as an example of
  robust design occupancy modeling.
}
\details{
  These are simulated data for an imaginary situation with
  35 independent 'sites' on which presence/absence of a
  breeding bird is recorded 3 times annually for 3 years.
  Potential variables influencing site occupancy are the
  size of the site in hectares (samplearea) and canopy
  cover percentage (cover). The timing of the surveys
  within the year is thought to influence the detection of
  occupancy, so the week the survey was conducted is
  included in 9 variables that are named as occps where p
  is the primary session (year) number and s is the
  secondary session (visit) number. Using
  \code{data(RDOccupancy)} will retrieve the completed
  dataframe and using \code{example(RDOccpancy)} will run
  the example code. However, in this example we also show
  how to import the raw data and how they were modified to
  construct the \code{RDOccupancy} dataframe.

  For this example, the raw data are shown below and the
  code below assumes the file is named
  \code{RD_example.txt}.

  \preformatted{ ch samplearea cover occ11 occ12 occ13
  occ21 occ22 occ23 occ31 occ32 occ33 11011.100 12 0.99 1 5
  6 2 4 . 1 5 8 000110100 9 0.64 4 5 8 1 2 7 2 5 9
  10.100110 9 0.21 1 2 . 1 5 8 2 3 6 110000100 8 0.54 2 5 9
  5 8 11 2 5 8 111101100 15 0.37 1 3 5 6 8 9 5 7 12
  11..11100 10 0.04 1 2 . . 2 3 5 8 14 100000100 17 0.58 2
  3 8 5 6 7 2 . 9 100110000 9 0.38 5 8 14 1 2 8 5 8 16
  1001.0100 6 0.25 4 6 8 1 . 3 1 5 6 1.110000. 17 0.34 1 .
  4 3 5 9 4 5 . 111100000 3 0.23 1 2 3 4 5 6 7 8 9
  000000000 15 0.87 1 2 8 2 5 6 3 7 11 1111.0010 8 0.18 1 2
  4 1 . 3 2 3 . 10011011 . 7 0.72 2 4 5 2 6 7 1 2 .
  110001010 14 0.49 2 5 6 4 8 9 11 12 13 101.10100 13 0.31
  1 2 3 . 2 5 1 4 6 100000010 10 0.6 1 5 7 8 9 10 5 8 9
  010100010 12 0.67 1 4 5 2 6 8 3 4 7 110.01110 11 0.71 1 2
  3 . 4 6 1 2 7 10.11.100 10 0.26 1 2 . 1 2 . 1 5 6
  110100.10 9 0.56 1 4 7 2 3 4 . 2 7 010000000 10 0.16 1 5
  7 8 9 11 6 7 8 000000.00 10 0.46 1 2 5 2 5 8 . 3 4
  1.0000100 12 0.69 2 . 4 5 7 9 1 2 4 100010000 11 0.42 1 2
  3 4 5 6 7 8 9 000000000 12 0.42 2 5 6 5 8 9 1 3 4
  0.1100110 8 0.72 1 . 5 2 5 8 1 5 7 11.100100 11 0.51 1 5
  . 1 2 4 4 5 6 000000000 11 0.37 1 2 3 4 5 6 7 8 9
  001100111 12 0.54 1 2 3 1 2 3 1 2 3 10.1.1100 9 0.37 1 2
  . 3 . 5 1 6 8 000000000 7 0.38 1 5 7 6 8 11 1 9 14
  1011.0100 8 0.35 1 5 7 2 . 5 1 3 4 100110000 9 0.86 1 2 4
  2 3 6 1 2 4 11.100111 8 0.57 1 5 . 2 6 7 1 3 5 }

  The data could be read into a dataframe with code as
  follows:
  \preformatted{RDOccupancy<-read.table("RD_example.txt",
  colClasses=c("character", rep("numeric",2),
  rep("character", 9)), header=TRUE)}

  Note that if the file was not in the same working
  directory as your workspace (.RData) then you can set the
  working directory to the directory containing the file by
  using the following command before the \code{read.table}.

  \code{setwd(your working directory location here)}

  In the data file "." represents a site that was not
  visited on an occasion. Those "." values are read in fine
  because \code{ch} is read in as a character string.
  However, "." has also been used in the file in place of
  numeric values of the \code{occ} variable. Because "." is
  not numeric, R will coerce the input value to an NA value
  for each "." and will treat the column they are in as a
  factor.  Thus, the "NA" will not be a valid numeric value
  for MARK, so we need to change it to a number. To avoid
  the coercion, the \code{occ} values were read in as
  characters and the following code changes all "." to "0"
  and then coverts the fields to numeric values:

  \preformatted{ for (i in 4:12) {
  RDOccupancy[RDOccupancy[,i]==".",i]="0"
  RDOccupancy[,i]=as.numeric(RDOccupancy[,i]) } }

  It is fine to use zero (or any numeric value) in place of
  missing values for session-dependent covariates as the
  "0's" provide no information for modeling as they are
  tied to un-sampled occasions. However, all values of a
  site-specific covariate (e.g., cover) are used, so there
  cannot be any missing values.  Note, however that use of
  "0's" in the time-dependent covariates will influence
  predictions output by MARK for that parameter, as they
  will be biased low due to the zero's being included in
  estimating the mean for that parameter.

  The code below and associated comments provide a self
  contained example for importing, setting up, and
  evaluating the any of the general robust design type
  models (RDOccupEG, RDOccupPE, RDOccupPG) using RMARK.
  Unlike standard occupancy designs, robust designs require
  the user to designate primary and secondary occasions
  using the argument \code{time.intervals}. For this
  example, we have 3 primary occasions (year) with 3
  secondary sampling occasions within each year, thus, we
  would set our \code{time.intervals} as follows to
  represent 0 interval between secondary occasions and
  interval of 1 (years in this case) between primary
  occasions:

  \preformatted{ time.intervals=c(0,0,1,0,0,1,0,0) }

  The first 0 designates the interval between the first and
  second sampling occasion in year 1, the second 0
  designates the interval between the second and third
  sampling occasion in year 1, and the 1 indicated the
  change from primary period 1 to primary period 2. See
  \code{\link{process.data}} for more information on the
  use of \code{time.intervals}.
}
\examples{
data(RDOccupancy)
#
# Example of epsilon=1-gamma
test_proc=process.data(RDOccupancy,model="RDOccupEG",time.intervals=c(0,0,1,0,0,1,0,0))
test_ddl=make.design.data(test_proc)
test_ddl$Epsilon$eps=-1
test_ddl$Gamma$eps=1
p.dot=list(formula=~1)
Epsilon.random.shared=list(formula=~-1+eps, share=TRUE)
model=mark(test_proc,test_ddl,model.parameters=list(Epsilon=Epsilon.random.shared, p=p.dot))
#
# A self-contained function for evaluating a set of user-defined candidate models
run.RDExample=function()
{
# Creating list of potential predictor variables for Psi

Psi.area=list(formula=~samplearea)
Psi.cover=list(formula=~cover)
Psi.areabycover=list(formula=~samplearea*cover)
Psi.dot=list(formula=~1)
Psi.time=list(formula=~time)

# Creating list of potential predictor variables for p
# When coding formula with session-dependent (primary or secondary)
# covariates, you do NOT have to include the session identifiers (
# the ps of occps) in the model formula. You only need to specify ~occ.
# The variable suffix can be primary occasion numbers or
# primary and secondary occasion numbers.

p.dot=list(formula=~1)
p.occ=list(formula=~occ)
p.area=list(formula=~sample.area)
p.coverbyocc=list(formula=~occ*cover)

# Creating list of potential predictor variables for Gamma
# and/or Epsilon (depending on which RDOccupXX Parameterization is used)

gam.area=list(formula=~samplearea)
epsilon.area=list(formula=~samplearea)
gam.dot=list(formula=~1)
epsilon.dot=list(formula=~1)

# setting time intervals for 3 primary sessions with
# secondary session length of 3,3,3

time_intervals=c(0,0,1,0,0,1,0,0)

# Initial data processing for RMARK RDOccupPG
# (see RMARK appendix C-3 for list of RDOccupXX model paramterizations)

RD_process=process.data(RDOccupancy, model="RDOccupPG",
time.intervals=time_intervals)
RD_ddl=make.design.data(RD_process)
# Candidate model list
# 1. Occupancy, detection, and colonization are constant

model.p.dot.Psi.dot.gam.dot<-mark(RD_process, RD_ddl,
model.parameters=list(p=p.dot, Psi=Psi.dot, Gamma=gam.dot),
invisible=TRUE)

# 2. Occupancy varies by time, detection is constant,
# colonization is constant

model.p.dot.Psi.time.gam.dot<-mark(RD_process, RD_ddl,
model.parameters=list(p=p.dot, Psi=Psi.time, Gamma=gam.dot),
invisible=TRUE)

# 3. Occupancy varies by area, detection is constant,
# colonization varies by area

model.p.dot.Psi.area.gam.area<-mark(RD_process,
RD_ddl, model.parameters=list(p=p.dot, Psi=Psi.area,
Gamma=gam.area), invisible=TRUE)

# 4. Occupancy varies by cover, detection is constant,
# colonization varies by area

model.p.dot.Psi.cover.gam.area<-mark(RD_process, RD_ddl,
model.parameters=list(p=p.dot, Psi=Psi.cover, Gamma=gam.area),
invisible=TRUE)

# 5. Occupancy is constant, detection is session dependent,
# colonization is constant

model.p.occ.Psi.dot.gam.dot<-mark(RD_process, RD_ddl,
model.parameters=list(p=p.occ, Psi=Psi.dot, Gamma=gam.dot),
invisible=TRUE)

# 6. Occupancy varied by area, detection is session
# dependent, colonization is constant
model.p.occ.Psi.area.gam.dot<-mark(RD_process, RD_ddl,
model.parameters=list(p=p.occ, Psi=Psi.area, Gamma=gam.dot),
invisible=TRUE)
#
# Return model table and list of models
#
return(collect.models())
}
# This runs the 6 models above-Note that if you use
# invisible=FALSE in the above model calls
# then the mark.exe prompt screen will show as each model is run.

robustexample<-run.RDExample() #This runs the 6 models above

# Outputting model selection results
robustexample 	# This will print selection results
options(width=150)	# Sets page width to 100 characters
sink("results.table.txt") # Captures screen output to file

# Remove comment to see output
#print.marklist(robustexample) # Sends output to file
sink() # Returns output to screen
#
# Allows you to view results in notepad;remove # to see output
# system("notepad results.table.txt", invisible=FALSE, wait=FALSE)

# Examine the output for Model 1: Psi(.), p(.), Gamma(.)
# Opens MARK results file in text editor
#robustexample$model.p.dot.Psi.dot.gam.dot

# View beta estimates for specified model in R
robustexample$model.p.dot.Psi.dot.gam.dot$results$beta

# View real estimates for specified model in R
robustexample$model.p.dot.Psi.dot.gam.dot$results$real

# Examine the best fitting model which has a time-dependent
# effect on detection
# (Model 5: Psi(.), p(occ), Gamma(.))

# View beta estimates for specified model in R
robustexample$model.p.occ.Psi.dot.gam.dot$results$beta

# View real estimates for specified model in R
robustexample$model.p.occ.Psi.dot.gam.dot$results$real

# View estimated variance/covariance matrix in R
robustexample$model.p.occ.Psi.dot.gam.dot$results$beta.vcv


# View model averages estimates for session-dependent
# detection probabilities
model.average(robustexample, "p", vcv=TRUE)

# View model averaged estimate for Psi (Occupancy)
model.average(robustexample, "Psi", vcv=TRUE)

# View model averaged estimate for Gamma (Colonization)
model.average(robustexample, "Gamma", vcv=TRUE)

#
# Compute real estimates across the range of covariates
# for a specific model parameter using Model 6
#
# Identify indices we are interested in predicting
# see covariate.predictions for information on
# index relationship to real parameters

summary.mark(robustexample$model.p.occ.Psi.area.gam.dot, se=TRUE)
# Define data frame of covariates to be used for analysis

ha<-sort(RDOccupancy$samplearea)

# Predict parameter of interest (Psi) across the
# range of covariate data of interest

Psi.by.Area<-covariate.predictions(robustexample,
data=data.frame(samplearea=ha), indices=c(1))

# View dataframe of real parameter estimates without var-cov
# matrix printing (use str(Psi.by.Area) to evaluate structure))

Psi.by.Area[1]

#Create a simple plot using plot() and lines()

plot(Psi.by.Area$estimates$covdata, Psi.by.Area$estimates$estimate,
type="l", xlab="Patch Area", ylab="Occupancy", ylim=c(0,1))
lines(Psi.by.Area$estimates$covdata, Psi.by.Area$estimates$lcl, lty=2)
lines(Psi.by.Area$estimates$covdata, Psi.by.Area$estimates$ucl, lty=2)

# For porting graphics directly to file, see pdf() or png(),
}
\author{
  Bret Collier
}
\keyword{dataset}
\keyword{datasets}


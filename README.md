# circlefitter
R package to fit circles to points

Someone asked on R-sig-geo about fitting a circle to a set of points. I found this
interesting little paper that claimed just doing a least-squares optimisation wasn't
the best idea:

http://www.spaceroots.org/documents/circle/circle-fitting.pdf

so I thought I'd implement it in R. Not quite there yet, this has some utility functions
and one least-squares fitting function from Edzer Pebesma.

Of course its not well documented. 


This might install it:

```
library(devtools)
install_github("barryrowlingson/circlefitter")
```

# Sample Usage

```
# some sample points
pts = arcnoise(100,10,20,4,0,pi/4,.1)

# initial guess via 3-point sampling
init = guess_circle(pts, 1000)

# fit via least-squares
fitc = fit_edzer(pts, init$centre, init$radius)

# plot the points
plot(pts,asp=1)

# plot the truth
plotCirc(c(10,20),4,col="red")

# plot the fitted circle
plotCirc(fitc$par[1:2],fitc$par[3])
```

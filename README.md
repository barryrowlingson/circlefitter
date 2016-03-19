# circlefitter
R package to fit circles to points

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

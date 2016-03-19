arcnoise = function(n, x=0, y=0, r=1, t1=0, t2=2*pi, sigma=0.1){
    theta = runif(n, t1, t2)
    rv = r + rnorm(n,0, sigma)
    data.frame(x = x + rv * cos(theta),
         y = y + rv * sin(theta))
  
}

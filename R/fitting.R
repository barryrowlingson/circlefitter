##' Edzer's least-square fit method
##'
##' .. content for \details{} ..
##' @title Edzer's least square fit method
##' @param pts two-column coordinates
##' @param xy0 initial xy centre 
##' @param r0 initial radius guess
##' @return optim output
##' @author Edzer Pebesma

fit_edzer <- function(pts, xy0, r0){
    x0=xy0[1]
    y0=xy0[2]
    SSdist2circ = function(par, x, y)  {
        x0 = par[1]
        y0 = par[2]
        r = par[3]
        sum(abs(sqrt((x-x0)^2+(y-y0)^2) - r))
    }

    p = optim(c(x0 = x0, y0 = y0, r = r0), SSdist2circ, x = pts[,1], y = pts[,2])
    p
}


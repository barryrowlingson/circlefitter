circumcenter = function(pI, pJ, pK){
    
    ##// some temporary variables
    dIJ = list(x = pJ$x - pI$x, y = pJ$y - pI$y)
    dJK = list(x = pK$x - pJ$x, y = pK$y - pJ$y)
    dKI = list(x = pI$x - pK$x, y = pI$y - pK$y)
    sqI = pI$x * pI$x + pI$y * pI$y
    sqJ = pJ$x * pJ$x + pJ$y * pJ$y
    sqK = pK$x * pK$x + pK$y * pK$y

    ##// determinant of the linear system: 0 for aligned points
    det = dJK$x * dIJ$y - dIJ$x * dJK$y
    if (abs(det) < 1.0e-10) {
      ##// points are almost aligned, we cannot compute the circumcenter
      return(NA)
    }

    ##// beware, there is a minus sign on Y coordinate!
    list(
    x = (sqI * dJK$y + sqJ * dKI$y + sqK * dIJ$y) / (2 * det),
    y = -(sqI * dJK$x + sqJ * dKI$x + sqK * dIJ$x) / (2 * det)
    )

  }

circumcentre = circumcenter

find_random_cc <- function(pts, nsamples){
    t(sapply(1:nsamples,
           function(i){
               pp = sample(nrow(pts),3)
               unlist(circumcenter(pts[pp[1],],
                            pts[pp[2],],
                            pts[pp[3],]
                            ))
           },
           simplify=TRUE
          ))
}

guess_circle <- function(pts, nsamples, aggregator=median){
    ccs = find_random_cc(pts, nsamples)
    xy = apply(ccs, 2, aggregator)
    r = aggregator(sqrt((pts[,1]-xy[1])^2 + (pts[,2]-xy[2])^2))
    list(centre=xy, radius=r)
}

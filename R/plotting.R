plotCirc = function(xy, r, ...) {
    sq = seq(0, 2 * pi, length.out = 100)
    lines(xy[1] + r * cos(sq), xy[2] + r * sin(sq), ...)
}

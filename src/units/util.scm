(declare (unit util))

(use (prefix sdl2 sdl2:)
     (prefix sdl2-image img:)
     miscmacros)

; TODO are these center procedures really necessary?
(define (util:surface-cx surface) (/ (sdl2:surface-w surface) 2))

(define (util:surface-cy surface) (/ (sdl2:surface-h surface) 2))

(define (util:clear-surface surface) (sdl2:fill-rect! surface #f const:bgcolor))


(define (util:point-in-rect x y rect)
  (let ((rx (sdl2:rect-x rect))
        (ry (sdl2:rect-y rect))
        (rw (sdl2:rect-w rect))
        (rh (sdl2:rect-h rect)))
        (display rx)
        (printf "\n")
        (display ry)
        (printf "\n")
        (display rw)
        (printf "\n")
        (display rh)
        (printf "\n")
        (display x)
        (printf "\n")
        (display y)
        (printf "\n");TODO remove debugging
    (and (> x rx) (< x (+ rx rw)) (> y ry) (< y (+ ry rh)))))



(define (util:draw-elements! elements surface ev)
  (if (not (null? elements))
    (let ()
      ((car elements) 'draw surface ev)
      (util:draw-elements! (cdr elements) surface ev))))

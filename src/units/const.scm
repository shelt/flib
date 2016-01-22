(declare (unit const))
(use (prefix sdl2 sdl2:)
     (prefix sdl2-image img:)
     miscmacros)

(define const:devmode #t)

(define const:bgcolor (sdl2:make-color 241 241 241))

(define const:splash-time (if const:devmode 0 5))

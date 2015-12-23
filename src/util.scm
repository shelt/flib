; TODO are these center procedures really necessary?
(define (util:surface-cx surface) (/ (sdl2:surface-w surface) 2))

(define (util:surface-cy surface) (/ (sdl2:surface-h surface) 2))

(define (util:clear-surface surface) (sdl2:fill-rect! surface #f const:bgcolor))

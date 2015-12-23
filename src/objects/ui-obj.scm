(define (make-ui-obj x y surface)
  ; METHODS ;
  (define (draw dest ev)
    (sdl2:blit-surface! surface #f dest (rect?)))

  ; ACCESSORS ;
  (define (x?) x)

  (define (y?) y)

  (define (surface?) surface)

  (define (rect?)
    (let ((w (sdl2:surface-w surface))
          (h (sdl2:surface-h surface)))
      (sdl2:make-rect (- x (floor (/ w 2))) (- y (floor (/ h 2))) w h)))

  ; MUTATORS ;
  (define (x! new-x) (set! x new-x))
  (define (y! new-y) (set! y new-y))
  (define (surface! new-surf) (set! surface new-surf))

  ; DISPATCHER ;
  (lambda (method . args)
      (case method
        ((draw) (apply draw args))
        ((x?) (apply x? args))
        ((y?) (apply y? args))
        ((surface?) (apply surface? args))
        ((rect?) (apply rect? args))
        ((x!) (apply x! args))
        ((y!) (apply y! args))
        ((surface!) (apply surface! args))
        (else (error "dispatch failed" method)))))

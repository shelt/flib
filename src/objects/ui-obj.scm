(define (make-ui-img x y c surface)
  (define (draw dest ev)
    (sdl2:blit-surface! surface #f dest (rect?)))

  (define (rect?)
    (let* ((w (sdl2:surface-w surface))
           (h (sdl2:surface-h surface))
           (x (if c (- x (floor (/ w 2))) x))
           (y (if c (- y (floor (/ h 2))) y)))
      (sdl2:make-rect x y w h)))

  ; DISPATCHER ;
  (lambda (method . args)
      (case method
        ((draw) (apply draw args))
        (else (error "dispatch failed" method)))))


(define (make-ui-basic-button x y c surface onpress)
  (define (draw dest ev)
		(let ((rect (rect?)))
			(if (and (eqv? (sdl2:event-type ev) 'mouse-button-up) (util:point-in-rect x y rect))
				(onpress))
    	  (sdl2:blit-surface! surface #f dest rect)))
	
  (define (rect?)
    (let* ((w (sdl2:surface-w surface))
           (h (sdl2:surface-h surface))
           (x (if c (- x (floor (/ w 2))) x))
           (y (if c (- y (floor (/ h 2))) y)))
      (sdl2:make-rect x y w h)))

  ; DISPATCHER ;
  (lambda (method . args)
      (case method
        ((draw) (apply draw args))
        (else (error "dispatch failed" method)))))

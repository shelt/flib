(define (make-ui-obj x y surface)
  (define (x?) x)
  (define (y?) y)
  (define (surface?) surface)

  (define (rect?)
    (let ((w (sdl2:surface-w surface))
          (h (sdl2:surface-h surface)))
      (sdl2:make-rect (- x (/ w 2)) (- y (/ h 2)) w h)))
  (define (draw dest)
    (sdl2:blit-surface! surf #f dest (rect)))

  (define (x! new-x) (set! x new-x))
  (define (y! new-y) (set! y new-y))
  (define (surface! new-surf) (set! surface new-surf))
  (lambda (method . args)
      (case method
        ((x?) (apply x? args))
        ((y?) (apply y? args))
        ((x!) (apply x! args))
        ((y!) (apply y! args))
        ((surface?) (apply surface? args))
        ((surface!) (apply surface! args))
        ((rect?) (apply rect? args))
        (else (error "dispatch failed" method)))))


; for each drawable: draw ********* TODO


;; TODO EVENT LOOPS SHOULD BE ACTIVITY-SPECIFIC
(define (draw-scene!)
  (let ((window-surf (sdl2:window-surface window)))
    ;; Clear the whole screen using a blue background color
    (sdl2:fill-rect! window-surf #f (sdl2:make-color 0 80 160))
    ;; Draw the smileys
    (draw-obj! smiley2 window-surf)
    (draw-obj! smiley1 window-surf)
    ;; Refresh the screen
    (sdl2:update-window-surface! window)))
